# Causal Demand Intelligence System

A demand intelligence system for retail and CPG that goes beyond volume forecasting to answer **why demand changes** and **what would happen under different scenarios**. Built using the Corporación Favorita dataset (Kaggle, 2017) as a proxy for Andean-region retail dynamics.

---

## Objective

Standard ML models (XGBoost, ARIMA, Prophet) predict *how much* demand to expect but cannot answer causal questions:

- Was the sales drop caused by the price increase, the exchange rate spike, or the political crisis?
- How much incremental demand did the promotion actually cause, net of what would have happened anyway?
- The central bank just raised interest rates. Should we adjust inventory positions?

This project uses **causal inference** to answer those questions from observational retail data.

---

## Core Capabilities

| Capability | Technology | Business Value |
|---|---|---|
| Causal Effect Estimation | DoWhy, EconML, R `grf` | Separates true promotion lift from seasonal coincidence |
| External Signal Detection | HuggingFace zero-shot NLP | Early demand signals from economic news |
| Causally-Informed Inventory | Python, scipy | Safety stock differentiated by controllable vs. uncontrollable uncertainty |

---

## Tech Stack

```
Python · R · SQL · DuckDB · DoWhy · EconML · HuggingFace · XGBoost · Streamlit
```

---

## Project Structure

```
causal-demand-intelligence/
├── docs/               # Project charter, roadmap, architecture
├── data/               # Raw, processed, external (not versioned)
├── notebooks/          # Jupyter notebooks (01–06)
├── src/                # Importable Python modules
│   ├── data/           # Load, features, validation
│   ├── causal/         # DAG, causal effects, counterfactuals
│   ├── nlp/            # Zero-shot classification, event features
│   ├── forecast/       # Baseline + ML models + evaluation
│   ├── inventory/      # Safety stock, ABC-XYZ, optimization
│   └── utils/          # Config, plotting, metrics
├── sql/                # DuckDB SQL scripts
├── r_analysis/         # R scripts (causal forests with grf)
├── reports/            # Exported figures and deliverables
└── app/                # Streamlit dashboard
```

---

## Modules

| Module | Status | Description |
|---|---|---|
| 1. Data Engineering | In Progress | DuckDB ingestion, schema audit, feature pipeline |
| 2. Exploratory Analysis | Complete | Distributional analysis, STL decomposition, causal DAG |
| 3. NLP Event Detection | Planned | Zero-shot classification of economic news |
| 4. Causal Analysis | Planned | DAG specification, ATE/CATE estimation, refutation tests |
| 5. Forecasting | Planned | Baseline vs. causal-enhanced models |
| 6. Inventory Optimization | Planned | Causal uncertainty decomposition for safety stock |

---

## Data Sources

- **Corporación Favorita** (Kaggle) — 125M rows of daily retail sales across 54 stores, Ecuador, 2013–2017
- **Macroeconomic indicators** — Oil prices (WTI), inflation, public expenditure

---

## Key Findings (EDA)

- **onpromotion** contains 21.6M missing values classified as MNAR (Little and Rubin, 2002); the missingness mechanism is structural, not random.
- Crude correlation between sales and oil price is r = -0.75, but after detrending the corrected coefficient drops to r = -0.19, indicating 0.56 points of spurious correlation.
- Weekly seasonality explains 47% of total variance (STL decomposition, Cleveland et al., 1990).
- Bootstrap confidence intervals (Efron and Tibshirani, 1993) estimate a promotional lift of 2.6x–2.8x on promoted items.

---

## Author

**Christian Flores Lozano**
Industrial Engineer | Supply Chain Analytics
[GitHub](https://github.com/cflores-scm)

---

## License

MIT — see [LICENSE](LICENSE) for details.
