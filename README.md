# Causal Demand Intelligence System

> *"Most forecasting projects answer 'how much.' This one answers 'why' and 'what if.'"*

[![Python](https://img.shields.io/badge/Python-3.11-blue?logo=python)](https://www.python.org/)
[![R](https://img.shields.io/badge/R-4.x-276DC3?logo=r)](https://www.r-project.org/)
[![DuckDB](https://img.shields.io/badge/DuckDB-yellow?logo=duckdb)](https://duckdb.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## Overview

A demand intelligence system for retail/CPG that goes beyond volume forecasting to answer **why demand changes** and **what would happen under different scenarios**. Built as a portfolio project targeting the Peruvian retail market using the Corporación Favorita dataset as a proxy for Andean-region CPG dynamics.

### Three Core Capabilities

| Capability | Technology | Business Value |
|---|---|---|
| **Causal Effect Estimation** | DoWhy, EconML, R `grf` | Separates true promotion lift from seasonal coincidence |
| **External Signal Detection** | HuggingFace zero-shot NLP | Early demand signals from economic news (BCRP, macro) |
| **Causally-Informed Inventory** | Python, scipy | Safety stock differentiated by controllable vs. uncontrollable uncertainty |

---

## Why This Matters

Standard ML models (XGBoost, ARIMA, Prophet) predict *how much* demand to expect but cannot answer causal questions:

- *"Was the sales drop caused by the price increase, the exchange rate spike, or the political crisis?"*
- *"How much incremental demand did the promotion actually cause — net of what would have happened anyway?"*
- *"The BCRP just raised interest rates. Should we adjust inventory positions?"*

This project uses **causal inference** to answer those questions from observational retail data.

---

## Tech Stack

```
Python · SQL · R · DuckDB · DoWhy · EconML · HuggingFace · XGBoost · Streamlit · Power BI
```

---

## Project Structure

```
causal-demand-intelligence/
├── docs/               # Project charter, roadmap, architecture
├── data/               # Raw, processed, external, model artifacts (not in git)
├── notebooks/          # Narrative Jupyter notebooks (01–06)
├── src/                # Importable Python modules
│   ├── data/           # Load, features, validation
│   ├── causal/         # DAG, causal effects, counterfactuals
│   ├── nlp/            # Zero-shot classification, event features
│   ├── forecast/       # Baseline + ML models + evaluation
│   ├── inventory/      # Safety stock, ABC-XYZ, optimization
│   └── utils/          # Config, plotting, metrics
├── sql/                # DuckDB SQL scripts
├── app/                # Streamlit dashboard
├── r_analysis/         # R scripts (causal forests with grf)
└── tests/              # Unit tests
```

---

## Modules

| Module | Status | Description |
|---|---|---|
| 1. Data Engineering | 🔄 In Progress | DuckDB ingestion, feature pipeline |
| 2. NLP Event Detection | ⏳ Planned | Zero-shot classification of economic news |
| 3. Causal Analysis | ⏳ Planned | DAG, ATE/CATE estimation, refutation tests |
| 4. Forecasting | ⏳ Planned | Baseline vs. causal-enhanced XGBoost |
| 5. Inventory Optimization | ⏳ Planned | Causal uncertainty decomposition |
| 6. Streamlit Dashboard | ⏳ Planned | Interactive deployment |

---

## Data Sources

- **Corporación Favorita** (Kaggle) — ~125M rows of daily retail sales, Ecuador
- **BCRP** — Peruvian macroeconomic data (IPC, tipo de cambio, tasa de interés)
- **Economic news** — BCRP press releases and financial media (processed with NLP)

---

## Author

**Christian Flores Lozano**  
Industrial Engineer | Supply Chain Analytics  
[GitHub: cflores-scm](https://github.com/cflores-scm)

---

## License

MIT — see [LICENSE](LICENSE) for details.
