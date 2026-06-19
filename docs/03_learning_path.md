# Learning Architecture — Knowledge Path

**Principle:** Learn just-in-time, not just-in-case. Each skill is mapped to the project phase where you need it.

---

## Level 1: Imprescindible — Must Know Before Starting

*These are prerequisites. Without them, you cannot begin Phase 0.*

### 1.1 Python for Data Analysis

| Attribute | Detail |
|-----------|--------|
| **What** | pandas, numpy, basic data manipulation, file I/O, virtual environments |
| **Why** | Primary language of the project. Every module depends on it. |
| **Time** | 1-2 weeks if coming from R; you already think in dataframes |
| **Resources** | [Python for Data Analysis, 3rd Ed.](https://wesmckinney.com/book/) (free online) — Chapters 4-8, 10. Focus on pandas operations that mirror dplyr: `groupby()` = `group_by()`, `query()` = `filter()`, `assign()` = `mutate()`. |
| **Practice** | Rewrite one of your R EDA scripts in Python. |

### 1.2 SQL Fundamentals

| Attribute | Detail |
|-----------|--------|
| **What** | SELECT, JOIN, GROUP BY, window functions, CTEs |
| **Why** | Data transformation backbone. DuckDB uses standard SQL. Recruiters filter for SQL. |
| **Time** | 1 week for basics; window functions take practice |
| **Resources** | [SQLBolt](https://sqlbolt.com/) (interactive, free). [Mode SQL Tutorial](https://mode.com/sql-tutorial/) for window functions. |
| **Practice** | Write the first 3 data transformations of the project in SQL instead of pandas. |

### 1.3 Git & GitHub Workflow

| Attribute | Detail |
|-----------|--------|
| **What** | Branching, commits, pull requests, .gitignore, README conventions |
| **Why** | Every recruiter checks your GitHub. Clean commit history signals professionalism. |
| **Time** | 2-3 days |
| **Resources** | [GitHub Skills](https://skills.github.com/) — "Introduction to GitHub" course (free, interactive). |
| **Practice** | Set up the repo with proper .gitignore, make your first feature branch. |

### 1.4 Jupyter Notebooks (Narrative Style)

| Attribute | Detail |
|-----------|--------|
| **What** | Markdown in notebooks, clean code cells, narrative flow |
| **Why** | Your EDA and analysis notebooks ARE the portfolio. They must tell a story. |
| **Time** | 1 day |
| **Resources** | Study notebooks from [Kaggle competition winners](https://www.kaggle.com/competitions) — observe how they structure narrative + code. |
| **Practice** | Write one EDA notebook that a non-technical person could follow. |

---

## Level 2: Importante — Learn During the Project

*These skills are needed for specific phases. Learn them when you reach that phase, not before.*

### 2.1 DuckDB for Analytical Queries

| Attribute | Detail |
|-----------|--------|
| **What** | DuckDB Python API, reading Parquet/CSV, analytical SQL |
| **Why** | Handles 125M+ rows on a laptop without a database server. Shows modern data engineering skills. |
| **When needed** | Phase 0-1 (Weeks 1-5) |
| **Time** | 2-3 days |
| **Resources** | [DuckDB Documentation](https://duckdb.org/docs/) — Start with "Python API" section. [DuckDB + pandas tutorial](https://duckdb.org/docs/guides/python/pandas.html). |

### 2.2 XGBoost & LightGBM for Time Series

| Attribute | Detail |
|-----------|--------|
| **What** | Gradient boosting for tabular forecasting, feature engineering for time series, hyperparameter tuning |
| **Why** | Industry standard for demand forecasting. Recruiters recognize these immediately. |
| **When needed** | Phase 4 (Weeks 8-11) |
| **Time** | 1 week |
| **Resources** | [XGBoost documentation](https://xgboost.readthedocs.io/). Kaggle's [Corporación Favorita competition notebooks](https://www.kaggle.com/competitions/favorita-grocery-sales-forecasting/code) — study top solutions. |

### 2.3 Time Series Cross-Validation

| Attribute | Detail |
|-----------|--------|
| **What** | Expanding window, sliding window, temporal train/test splits |
| **Why** | Standard ML cross-validation is invalid for time series. Using it correctly signals competence. |
| **When needed** | Phase 4 (Weeks 8-11) |
| **Time** | 2-3 days |
| **Resources** | scikit-learn's `TimeSeriesSplit`. [Hyndman & Athanasopoulos, FPP3](https://otexts.com/fpp3/) Chapter 5 (free online). |

### 2.4 Plotly for Interactive Visualization

| Attribute | Detail |
|-----------|--------|
| **What** | plotly.express, plotly.graph_objects, interactive charts |
| **Why** | Dashboard visualizations need interactivity. Static matplotlib isn't enough for Streamlit. |
| **When needed** | Phase 0 onwards, but especially Phase 5 (Weeks 11-14) |
| **Time** | 2-3 days |
| **Resources** | [Plotly Python documentation](https://plotly.com/python/) — start with plotly.express. |

### 2.5 Streamlit

| Attribute | Detail |
|-----------|--------|
| **What** | Layout, widgets, caching, multi-page apps, deployment |
| **Why** | Turns your analysis into a deployable web app with minimal frontend knowledge. |
| **When needed** | Phase 5 (Weeks 11-14) |
| **Time** | 3-4 days |
| **Resources** | [Streamlit documentation](https://docs.streamlit.io/). [30 Days of Streamlit](https://30days.streamlit.app/) (free). |

### 2.6 Basic pytest

| Attribute | Detail |
|-----------|--------|
| **What** | Writing unit tests, test fixtures, running tests |
| **Why** | Shows engineering discipline. Recruiters for data roles increasingly expect testing skills. |
| **When needed** | Phase 1 onwards |
| **Time** | 1 day |
| **Resources** | [pytest documentation — Getting Started](https://docs.pytest.org/en/stable/getting-started.html). |

---

## Level 3: Avanzado — The Differentiators

*These are the skills that separate this project from every other forecasting portfolio. They require dedicated study.*

### 3.1 Causal Inference — Conceptual Foundation ⭐

| Attribute | Detail |
|-----------|--------|
| **What** | Potential outcomes framework, DAGs, confounding, identification strategies |
| **Why** | Without understanding the *theory*, you'll misuse the tools. This is the intellectual core of the project. |
| **When needed** | Phase 2 (Weeks 5-8) — start studying in Week 4 |
| **Time** | 1-2 weeks of study before applying |
| **Resources** | **Primary:** [Causal Inference for the Brave and True](https://matheusfacure.github.io/python-causality-handbook/) — Free online book, Python-based, practical. Chapters 1-5, 10-12, 15. **Secondary:** [Brady Neal's Causal Inference Course](https://www.bradyneal.com/causal-inference-course) — Free video lectures. Watch lectures 1-6. **Reference:** Pearl, J. "The Book of Why" — Accessible introduction to causal thinking (not technical, good for intuition). |

### 3.2 DoWhy & EconML — Applied Causal ML ⭐

| Attribute | Detail |
|-----------|--------|
| **What** | Defining causal models in DoWhy, estimating effects with EconML (Double ML, Causal Forest), refutation tests |
| **Why** | These are Microsoft Research's open-source causal inference libraries. They are the most mature Python tools for this. |
| **When needed** | Phase 2 (Weeks 5-8) |
| **Time** | 1 week of practice after conceptual foundation |
| **Resources** | [DoWhy User Guide](https://www.pywhy.org/dowhy/). [EconML User Guide](https://econml.azurewebsites.net/spec/estimation.html). [DoWhy + EconML example notebooks](https://github.com/py-why/dowhy/tree/main/docs/source/example_notebooks). |

### 3.3 NLP — Zero-Shot Classification

| Attribute | Detail |
|-----------|--------|
| **What** | Using pre-trained HuggingFace models for text classification without training data |
| **Why** | Enables the event detection module without any labeled dataset or model training. |
| **When needed** | Phase 3 (Weeks 7-9) |
| **Time** | 2-3 days |
| **Resources** | [HuggingFace Zero-Shot Classification Pipeline](https://huggingface.co/tasks/zero-shot-classification). Model: `joeddav/xlm-roberta-large-xnli` (multilingual, handles Spanish). |

### 3.4 Power BI Desktop

| Attribute | Detail |
|-----------|--------|
| **What** | Data modeling, DAX basics, report design, visual best practices |
| **Why** | Most demanded BI tool in Latin America. Even one well-designed report shows the skill. |
| **When needed** | Phase 5 (Week 14) — build after Streamlit is done |
| **Time** | 3-4 days |
| **Resources** | [Microsoft Power BI Learning Path](https://learn.microsoft.com/en-us/training/powerplatform/power-bi) (free). |

### 3.5 Docker Basics (Optional but Valuable)

| Attribute | Detail |
|-----------|--------|
| **What** | Dockerfile, docker-compose, containerizing a Python app |
| **Why** | Signals DevOps awareness. "Runs on my machine" → "Runs anywhere." |
| **When needed** | Phase 6 (Week 16) — only if time allows |
| **Time** | 2 days |
| **Resources** | [Docker Getting Started](https://docs.docker.com/get-started/). |

---

## Learning Schedule Mapped to Project Phases

| Week | Project Phase | Study Focus | Hours/Week |
|------|--------------|-------------|------------|
| 1 | Phase 0: Setup | Python pandas (if needed), DuckDB, Git | 5-8h study |
| 2-3 | Phase 0: EDA | SQL window functions, Plotly basics | 3-5h study |
| 4 | Phase 1: ETL | pytest basics, start causal inference theory | 5-8h study |
| 5 | Phase 2 start | Causal inference theory (intensive) | 8-10h study |
| 6-7 | Phase 2 | DoWhy + EconML applied | 5-8h study |
| 7-8 | Phase 3 | HuggingFace zero-shot NLP | 3-5h study |
| 9-10 | Phase 4 | XGBoost for time series, CV methods | 3-5h study |
| 11-13 | Phase 5 | Streamlit | 3-5h study |
| 14 | Phase 5 | Power BI | 3-4h study |
| 15-16 | Phase 6 | Docker (optional), LinkedIn writing | 2-3h study |

---

## R — Where It Still Adds Value

R remains useful for specific analytical tasks within this Python-primary project:

| Use Case | Why R | Package |
|----------|-------|---------|
| Causal Forest (alternative implementation) | `grf` is arguably the best Causal Forest implementation available | `grf` |
| Statistical visualization for reports | ggplot2 produces publication-quality static plots | `ggplot2` |
| Time series diagnostics | `feasts` and `tsibble` have excellent decomposition tools | `fable`, `feasts` |

**Integration:** Use R scripts for specific analyses, called from Python via subprocess or kept as standalone notebooks. Do not build the main pipeline in R.
