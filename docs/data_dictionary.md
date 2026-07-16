# Data Dictionary — Causal Demand Intelligence System

> **Source:** Corporación Favorita Grocery Sales Forecasting (Kaggle, 2017)  
> **Storage:** `data/raw/favorita.duckdb` — single DuckDB file containing all tables  
> **Period:** January 1, 2013 – August 15, 2017  
> **Scale:** ~125 million rows (sales table)

---

## Table: `sales`

The core fact table. One row = one item sold in one store on one day.

| Column | Type | Description | Notes |
|---|---|---|---|
| `id` | BIGINT | Surrogate row key | Not meaningful for analysis |
| `date` | DATE | Sales date | Range: 2013-01-01 to 2017-08-15 |
| `store_nbr` | BIGINT | Store identifier | FK → `stores.store_nbr` |
| `item_nbr` | BIGINT | Item/SKU identifier | FK → `items.item_nbr` |
| `unit_sales` | DOUBLE | Units sold that day | **Can be negative** (returns/reversals) |
| `onpromotion` | VARCHAR | Whether item was on promotion | `'True'` / `'False'` / `NULL` |

**Data quality issues:**
- `unit_sales < 0`: ~0.5% of rows — represent merchandise returns, not errors.
- `onpromotion IS NULL`: ~17.6% of rows — concentrated almost entirely before mid-2014. Caused by a phased rollout of the promotion tracking system, not random missingness.

---

## Table: `stores`

One row per physical store location.

| Column | Type | Description | Notes |
|---|---|---|---|
| `store_nbr` | BIGINT | Store identifier | PK; 54 unique stores |
| `city` | VARCHAR | City name | e.g., `'Quito'`, `'Guayaquil'` |
| `state` | VARCHAR | Province/state | e.g., `'Pichincha'`, `'Guayas'` |
| `type` | VARCHAR | Store format type | Values: `A`, `B`, `C`, `D`, `E` |
| `cluster` | INTEGER | Stores grouping | 1–17; similar stores clustered together by Favorita |

**Store type reference:**
- Type `A`: Large-format / high-volume flagship stores
- Type `B`: Medium-format urban stores
- Type `C`: Smaller neighborhood stores
- Type `D`: Different format (specialty / convenience)
- Type `E`: Smallest format

---

## Table: `items`

Item/SKU master catalog. One row per product.

| Column | Type | Description | Notes |
|---|---|---|---|
| `item_nbr` | BIGINT | Item identifier | PK; ~4,100 unique items |
| `family` | VARCHAR | Product category | 33 families (e.g., `GROCERY I`, `BEVERAGES`) |
| `class` | INTEGER | Sub-category within family | More granular than `family` |
| `perishable` | INTEGER | Is item perishable? | `1` = yes, `0` = no |

**Top families by total sales volume:**
`GROCERY I` > `BEVERAGES` > `PRODUCE` > `CLEANING` > `DAIRY`

---

## Table: `transactions`

Daily transaction count per store. Represents customer visits (or checkout events), not individual SKUs.

| Column | Type | Description | Notes |
|---|---|---|---|
| `date` | DATE | Transaction date | Matches `sales.date` range |
| `store_nbr` | BIGINT | Store identifier | FK → `stores.store_nbr` |
| `transactions` | BIGINT | Number of transactions | Proxy for foot traffic |

**Use:** Can be joined with `sales` as a demand normalizer (units per transaction).  
**Coverage:** Not all days/stores with sales have a corresponding transactions row.

---

## Table: `holidays_events`

Calendar of national, regional, and local holidays and special events in Ecuador.

| Column | Type | Description | Notes |
|---|---|---|---|
| `date` | DATE | Event date | Can overlap with sales dates |
| `type` | VARCHAR | Event type | `Holiday`, `Event`, `Additional`, `Bridge`, `Transfer`, `Work Day` |
| `locale` | VARCHAR | Geographic scope | `National`, `Regional`, `Local` |
| `locale_name` | VARCHAR | Specific location name | State or city name for Regional/Local events |
| `description` | VARCHAR | Event description | e.g., `'Navidad'`, `'Carnaval'` |
| `transferred` | VARCHAR | Was it transferred? | `'True'` if officially moved; `'False'` otherwise |

**Notes:**
- `Transfer` type rows mark dates that were officially moved from another date.
- `Bridge` days are weekdays between a holiday and a weekend.
- Must be joined to `sales` on `date` (and optionally filtered by `locale`/`locale_name` matching store geography).

---

## Table: `oil`

Daily WTI crude oil price (USD per barrel). Ecuador is an oil-dependent economy.

| Column | Type | Description | Notes |
|---|---|---|---|
| `date` | DATE | Price date | 2013-01-01 to 2017-08-31 |
| `dcoilwtico` | DOUBLE | WTI closing price (USD/bbl) | **43 NAs** — all on weekends and public holidays |

**Data quality:** NAs occur when financial markets are closed. Recommended imputation: LOCF (last observation carried forward).  
**Key event:** WTI fell from ~$100 in mid-2014 to ~$45 in early 2016, a structural break in the macro environment.

---

## External: `data/external/bcrp_macro_mensual.csv`

Monthly macroeconomic indicators from Peru's Central Reserve Bank (BCRP).  
Used as a macroeconomic context proxy alongside the Ecuador-based Favorita data.

| Column | Type | Description | Notes |
|---|---|---|---|
| `fecha` | DATE | First day of the month | Monthly frequency |
| `ipc_var_pct` | DOUBLE | CPI monthly variation (%) | Peru inflation indicator |
| `tipo_cambio_venta_usd` | DOUBLE | USD/PEN sell rate | Soles per dollar |

**Coverage:** January 2012 – December 2017 (full overlap with Favorita period).  
**Caution:** These are **Peruvian** indicators. Ecuador uses the US dollar (no domestic exchange rate). The BCRP series serves as a regional macro proxy and potential confounder, not a direct local effect.

---

## Selected Modeling Subsets

Five store–family combinations chosen for causal demand modeling. Selection criteria: ≥ 1,400 days of data, daily average ≥ 5 units, ≥ 70% active-day rate.

| Label | `store_nbr` | `family` | Store Type | Rationale |
|---|---|---|---|---|
| T44 — GROCERY I | 44 | GROCERY I | A | Highest-volume benchmark; complete coverage |
| T3 — BEVERAGES | 3 | BEVERAGES | D | High volume; different store format for contrast |
| T44 — PRODUCE | 44 | PRODUCE | A | High variance + seasonal signal; assortment break pre-2015 |
| T45 — GROCERY I | 45 | GROCERY I | A | Cross-store comparison (same type, different cluster) |
| T49 — BEVERAGES | 49 | BEVERAGES | A | Mid-volume; Cluster 11 for intra-family contrast |

**Known data issues in selected subsets:**
- `T44 — PRODUCE`: near-zero sales in several months of 2013–2014 (SKU assortment restructuring). Pre-2015 segment requires careful handling.
- All subsets: `onpromotion` NAs before mid-2014 (see `sales` table notes above).

---

## Entity Relationship

```
sales ──── store_nbr ──► stores
      └──── item_nbr  ──► items

transactions ── store_nbr ──► stores
              └── date ──────► (sales.date, holidays_events.date, oil.date)

holidays_events ── date ──► (join to sales on date)
oil             ── date ──► (join to sales on date)
bcrp_macro      ── fecha (monthly) ──► (join to monthly-aggregated sales)
```

---

*Last updated: 2026-07-10 · Christian Flores Lozano*
