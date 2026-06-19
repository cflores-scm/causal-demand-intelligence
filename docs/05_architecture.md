# Architecture Overview

---

## System Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                        DATA SOURCES                                 │
├──────────────────┬──────────────────┬───────────────────────────────┤
│  Corporación     │  BCRP Macro      │  Economic News               │
│  Favorita        │  Data            │  (BCRP reports, press)       │
│  (Kaggle)        │  (IPC, FX, rates)│                              │
└────────┬─────────┴────────┬─────────┴──────────────┬───────────────┘
         │                  │                         │
         ▼                  ▼                         ▼
┌─────────────────────────────────────┐    ┌──────────────────────────┐
│     MODULE 1: DATA ENGINEERING      │    │  MODULE 2: NLP EVENT     │
│                                     │    │  DETECTION               │
│  • Raw data ingestion               │    │                          │
│  • DuckDB storage (SQL)             │    │  • Text collection       │
│  • Feature engineering              │    │  • Zero-shot classify    │
│  • Calendar / lag / macro features  │    │  • Event taxonomy        │
│  • Data validation                  │    │  • Feature generation    │
│                                     │    │                          │
│  Python, DuckDB, pandas, SQL        │    │  Python, HuggingFace     │
└────────────────┬────────────────────┘    └────────────┬─────────────┘
                 │                                      │
                 ▼                                      │
┌─────────────────────────────────────┐                 │
│     MODULE 3: CAUSAL ANALYSIS       │◄────────────────┘
│                                     │
│  • DAG specification                │
│  • Causal effect estimation         │
│  • Double ML / Causal Forest        │
│  • Refutation tests                 │
│  • Counterfactual estimation        │
│                                     │
│  Python (DoWhy, EconML), R (grf)    │
└────────────────┬────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────┐
│     MODULE 4: FORECASTING           │
│                                     │
│  • Baseline models                  │
│  • XGBoost / LightGBM              │
│  • Standard vs causal features      │
│  • Time series cross-validation     │
│  • Model comparison                 │
│                                     │
│  Python, scikit-learn, xgboost      │
└────────────────┬────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────┐
│     MODULE 5: INVENTORY             │
│     OPTIMIZATION                    │
│                                     │
│  • Causal uncertainty decomposition │
│  • Safety stock (controllable vs    │
│    uncontrollable variance)         │
│  • ABC-XYZ classification           │
│  • Service level trade-offs         │
│                                     │
│  Python, scipy                      │
└────────────────┬────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    MODULE 6: PRESENTATION LAYER                     │
├──────────────────────────────────┬──────────────────────────────────┤
│  Streamlit Dashboard             │  Power BI Executive Report       │
│                                  │                                  │
│  • Forecast explorer             │  • KPI summary                   │
│  • Causal driver analysis        │  • Executive-level insights      │
│  • Counterfactual simulator      │  • PDF export for LinkedIn       │
│  • Event timeline                │                                  │
│  • Inventory recommendations     │                                  │
│                                  │                                  │
│  Deployed: Streamlit Cloud       │  Local: Power BI Desktop         │
└──────────────────────────────────┴──────────────────────────────────┘
```

---

## Project Directory Structure

```
causal-demand-intelligence/
│
├── README.md                          # Professional project README
├── LICENSE                            # MIT License
├── .gitignore                         # Python + data exclusions
├── requirements.txt                   # Python dependencies
├── Dockerfile                         # (Optional) Container definition
├── Makefile                           # Common commands (make data, make test, etc.)
│
├── docs/                              # Project documentation
│   ├── 01_project_charter.md
│   ├── 02_roadmap.md
│   ├── 03_learning_path.md
│   ├── 04_tech_stack.md
│   ├── 05_architecture.md
│   ├── 06_execution_plan.md
│   └── data_dictionary.md
│
├── data/                              # Data directory (NOT in git, except .gitkeep)
│   ├── raw/                           # Original unmodified data
│   │   └── .gitkeep
│   ├── processed/                     # Cleaned, feature-engineered data
│   │   └── .gitkeep
│   ├── external/                      # Macro data, holidays, news corpus
│   │   └── .gitkeep
│   └── models/                        # Saved model artifacts
│       └── .gitkeep
│
├── notebooks/                         # Jupyter notebooks (numbered, narrative)
│   ├── 01_eda_exploration.ipynb
│   ├── 02_feature_engineering.ipynb
│   ├── 03_causal_analysis.ipynb
│   ├── 04_nlp_event_detection.ipynb
│   ├── 05_forecasting_comparison.ipynb
│   └── 06_inventory_optimization.ipynb
│
├── src/                               # Source code (importable modules)
│   ├── __init__.py
│   ├── data/                          # Data loading and processing
│   │   ├── __init__.py
│   │   ├── load.py                    # Data loading functions
│   │   ├── features.py                # Feature engineering
│   │   └── validate.py                # Data validation
│   ├── causal/                        # Causal analysis module
│   │   ├── __init__.py
│   │   ├── dag.py                     # DAG specification
│   │   ├── effects.py                 # Causal effect estimation
│   │   └── counterfactual.py          # Counterfactual analysis
│   ├── nlp/                           # NLP event detection module
│   │   ├── __init__.py
│   │   ├── classify.py                # Zero-shot classification
│   │   ├── events.py                  # Event feature generation
│   │   └── taxonomy.py                # Event category definitions
│   ├── forecast/                      # Forecasting module
│   │   ├── __init__.py
│   │   ├── baseline.py                # Naive, seasonal naive
│   │   ├── ml_models.py               # XGBoost, LightGBM
│   │   └── evaluate.py                # Metrics, cross-validation
│   ├── inventory/                     # Inventory optimization
│   │   ├── __init__.py
│   │   ├── safety_stock.py            # Causal safety stock
│   │   ├── classification.py          # ABC-XYZ
│   │   └── optimization.py            # Reorder points, trade-offs
│   └── utils/                         # Shared utilities
│       ├── __init__.py
│       ├── config.py                  # Project configuration
│       ├── plotting.py                # Common plot functions
│       └── metrics.py                 # Shared metrics
│
├── sql/                               # SQL scripts for DuckDB
│   ├── 01_create_tables.sql
│   ├── 02_feature_views.sql
│   └── 03_analytical_queries.sql
│
├── app/                               # Streamlit application
│   ├── app.py                         # Main entry point
│   ├── pages/                         # Multi-page Streamlit app
│   │   ├── 1_forecast_explorer.py
│   │   ├── 2_causal_drivers.py
│   │   ├── 3_counterfactual_sim.py
│   │   ├── 4_event_timeline.py
│   │   └── 5_inventory.py
│   └── components/                    # Reusable UI components
│       └── charts.py
│
├── reports/                           # Generated reports and figures
│   ├── figures/                       # Exported visualizations
│   └── powerbi/                       # Power BI files
│
├── tests/                             # Unit tests
│   ├── test_features.py
│   ├── test_causal.py
│   └── test_forecast.py
│
├── r_analysis/                        # R scripts for specific analyses
│   ├── causal_forest_grf.R
│   └── ts_diagnostics.R
│
└── .github/
    └── workflows/
        └── ci.yml                     # Linting + tests on push
```

---

## Data Flow

```
Raw Data (CSV/Parquet)
    │
    ▼
DuckDB (local analytical database)
    │
    ├──► SQL transformations ──► Feature tables
    │
    ▼
pandas DataFrames (in-memory)
    │
    ├──► Causal Analysis (DoWhy/EconML) ──► Causal effects + counterfactuals
    │
    ├──► NLP Pipeline (HuggingFace) ──► Event features
    │
    ├──► ML Models (XGBoost/LightGBM) ──► Forecasts
    │
    ├──► Inventory Optimization ──► Recommendations
    │
    ▼
Streamlit App (interactive presentation)
    │
    ▼
Streamlit Community Cloud (deployed, public URL)
```

---

## Key Design Decisions

| Decision | Rationale |
|----------|-----------|
| **DuckDB over pandas-only** | 125M rows won't fit in memory as a single pandas DataFrame. DuckDB enables SQL-based aggregation before loading into memory. |
| **Modular `src/` package** | Each module can be developed, tested, and demonstrated independently. If NLP module fails, causal module still works. |
| **Notebooks for narrative, `src/` for code** | Notebooks tell the story; `src/` contains reusable, tested code. Notebooks import from `src/`. |
| **Streamlit over Shiny** | Python-native, free deployment, lower barrier, more recognizable to recruiters. |
| **XGBoost over LSTM/deep learning** | Better performance on tabular data, interpretable, no GPU needed, industry standard for demand forecasting. |
| **Zero-shot NLP over fine-tuning** | No labeled training data needed. Works out of the box. Demonstrates practical NLP skills. |
| **Store-family granularity** | Individual SKU modeling is computationally prohibitive (4000+ SKUs × 54 stores). Store-family level is sufficient for demonstrating the methodology. |
