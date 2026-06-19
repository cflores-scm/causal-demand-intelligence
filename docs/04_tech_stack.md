# Technology Justification

**Principle:** Every technology in this project is selected for three reasons simultaneously: (1) it solves a real technical need, (2) it's free/open-source, and (3) it's recognized by recruiters in the target job market.

---

## Core Languages

### Python — Primary Language

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Main language for ETL, modeling, NLP, dashboard, deployment |
| **Why** | Most demanded language in data science globally. Mature ecosystem for causal inference (DoWhy/EconML), NLP (HuggingFace), and web apps (Streamlit). |
| **Market demand** | Present in 85%+ of Data Analyst/Data Scientist job postings in LATAM. |
| **Recruiter signal** | "This candidate can work in production Python environments." |
| **Cost** | $0 |

### SQL — Data Transformation

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Data queries, transformations, schema design in DuckDB |
| **Why** | Universal language of data. Every company uses SQL. Writing analytical SQL shows you can work with databases, data warehouses, and BI tools. |
| **Market demand** | Required in 90%+ of SC Analytics job postings. |
| **Recruiter signal** | "This candidate can query our data warehouse from day one." |
| **Cost** | $0 |

### R — Analytical Complement

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Causal Forest (`grf`), statistical visualization (`ggplot2`), time series diagnostics (`fable`) |
| **Why** | Specific packages (`grf` for Causal Forest) are best-in-class in R. Shows bilingual data science capability. |
| **Market demand** | Valued in analytics-heavy roles, especially in pharmaceutical, CPG, and research contexts. |
| **Recruiter signal** | "This candidate is analytically versatile, not locked into one ecosystem." |
| **Cost** | $0 |

---

## Data Engineering

### DuckDB — Analytical Database

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Store and query 125M+ rows locally without a server |
| **Why** | Handles the Favorita dataset on a laptop. Supports standard SQL. No installation, no server, no configuration. Increasingly adopted in industry (dbt, Motherduck). |
| **Alternative considered** | SQLite (less analytical SQL support), PostgreSQL (requires server setup) |
| **Recruiter signal** | "This candidate knows modern data engineering tools, not just pandas." |
| **Cost** | $0 |

### pandas — Data Manipulation

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Feature engineering, data wrangling, in-memory transformations |
| **Why** | Standard Python data manipulation. The bridge between SQL queries and ML models. |
| **Cost** | $0 |

---

## Machine Learning & Causal Inference

### scikit-learn — ML Framework

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Model evaluation, cross-validation, pipelines, preprocessing |
| **Why** | Industry standard. TimeSeriesSplit, metrics, pipeline API. |
| **Cost** | $0 |

### XGBoost & LightGBM — Gradient Boosting

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Main forecasting models |
| **Why** | Dominant in tabular prediction tasks. Every SC analytics team uses or evaluates these. XGBoost is the single most important ML algorithm for a demand planner to know. |
| **Recruiter signal** | "This candidate knows the models we actually use in production." |
| **Cost** | $0 |

### DoWhy + EconML — Causal Inference (Microsoft Research)

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Causal graph definition, effect estimation, counterfactual reasoning |
| **Why** | Most mature open-source causal inference framework. Backed by Microsoft Research. Growing adoption in tech (Microsoft, Amazon, Netflix use causal methods). Part of the PyWhy ecosystem. |
| **Recruiter signal** | "This candidate understands causality, not just correlation. That's rare." |
| **Cost** | $0 |

### grf (R) — Generalized Random Forests

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Causal Forest for heterogeneous treatment effect estimation |
| **Why** | Best implementation of Causal Forests (Athey & Wager, Stanford). Discovers which subgroups respond differently to interventions. |
| **Cost** | $0 |

---

## NLP & Generative AI

### HuggingFace Transformers — Pre-trained NLP

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Zero-shot text classification of economic news into demand-impact categories |
| **Why** | No training data needed. Pre-trained multilingual models handle Spanish. Runs on CPU. |
| **Model** | `joeddav/xlm-roberta-large-xnli` (zero-shot, multilingual) |
| **Alternative considered** | OpenAI API (costs money), fine-tuning a model (needs labeled data and GPU) |
| **Recruiter signal** | "This candidate can apply NLP practically, not just theoretically." |
| **Cost** | $0 |

### Ollama + Llama 3 (Optional) — Local LLM

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Optional: richer event interpretation, text summarization |
| **Why** | Runs completely locally. No API costs. Demonstrates Gen AI capability. |
| **When to use** | Only if zero-shot classification is insufficient. This is a nice-to-have, not a dependency. |
| **Cost** | $0 |

---

## Visualization & Dashboards

### Plotly — Interactive Charts

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Interactive visualizations in notebooks and Streamlit |
| **Why** | Industry standard for interactive data viz in Python. Works natively with Streamlit. |
| **Cost** | $0 |

### Streamlit — Web Application

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Interactive dashboard for causal analysis, counterfactual simulator, forecast explorer |
| **Why** | Fastest path from Python script to deployed web app. Free deployment via Streamlit Community Cloud. No frontend knowledge needed. |
| **Alternative considered** | Shiny for Python (less mature), Dash (more complex), Flask (too much boilerplate) |
| **Recruiter signal** | "This candidate can build and deploy data applications, not just notebooks." |
| **Cost** | $0 (including deployment) |

### Power BI Desktop — Executive Reporting

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Executive-level summary dashboard with KPIs |
| **Why** | Most demanded BI tool in Latin America. Shows you can communicate with business stakeholders, not just data teams. |
| **Recruiter signal** | "This candidate speaks both technical and business languages." |
| **Cost** | $0 (Desktop version is free on Windows) |

### matplotlib + seaborn — Static Visualization

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Publication-quality static plots for notebooks and reports |
| **Why** | Standard Python visualization. Good for EDA and final report figures. |
| **Cost** | $0 |

---

## DevOps & Reproducibility

### Git + GitHub — Version Control

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Version control, collaboration showcase, CI/CD, portfolio hosting |
| **Why** | Non-negotiable for any technical role. The repo IS the portfolio. |
| **Cost** | $0 |

### GitHub Actions — CI/CD

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Automated linting, testing on push |
| **Why** | Shows engineering discipline. "My code is tested automatically." |
| **Cost** | $0 (2000 minutes/month free) |

### Docker (Optional) — Containerization

| Attribute | Detail |
|-----------|--------|
| **Role in project** | Package the entire project into a reproducible container |
| **Why** | Demonstrates DevOps awareness. Valuable for Data Engineering and MLOps roles. |
| **When to use** | Week 16, only if time allows. Nice-to-have, not critical. |
| **Cost** | $0 |

---

## Data Sources

| Source | Data | Access | Cost |
|--------|------|--------|------|
| Kaggle — Corporación Favorita | 125M+ rows of grocery sales, 54 stores, 4000+ SKUs | Public download | $0 |
| BCRP (Banco Central de Reserva del Perú) | IPC, exchange rate, interest rates, monetary policy reports | Public API + reports | $0 |
| Peru National Holidays | Official holiday calendar | Public | $0 |
| Economic News (El Comercio, Gestión, RPP) | News articles for NLP event detection | Web scraping / manual curation | $0 |

---

## Technology NOT Used (and Why)

| Technology | Why Not |
|-----------|---------|
| AWS/GCP/Azure | Costs money. Everything runs locally. |
| OpenAI API | Costs money. HuggingFace + Ollama provide free alternatives. |
| Databricks / Snowflake | Enterprise tools. DuckDB provides equivalent analytical power for this scale. |
| LSTM / Deep Learning | Requires GPU, marginal improvement on tabular data, harder to explain to recruiters. XGBoost is more practical and recognized. |
| Prophet | Widely used but generic. Doesn't add differentiation. XGBoost with proper features performs equally well. |
| Tableau | License cost. Power BI Desktop is free and equally recognized in LATAM. |
