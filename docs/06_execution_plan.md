# Execution Plan — Week by Week

**Start Date:** Week of June 23, 2026 (adjustable)  
**MVP Target:** Week 10 (~September 1, 2026)  
**Final Delivery:** Week 16 (~October 13, 2026)  

---

## Week 1: Environment & Data Acquisition

**Objective:** Everything set up, all data downloaded, first look at the data.

| # | Task | Output |
|---|------|--------|
| 1 | Create new GitHub repo `causal-demand-intelligence` | Public repo with README |
| 2 | Set up Python virtual environment, install core packages | `requirements.txt` |
| 3 | Download Corporación Favorita dataset from Kaggle | Files in `data/raw/` |
| 4 | Download BCRP macroeconomic data (IPC, exchange rate) | Files in `data/external/` |
| 5 | Load all data into DuckDB, verify schemas | `sql/01_create_tables.sql` |
| 6 | First look: row counts, column types, date ranges | Terminal / notebook notes |

**Validation:** Can you run `SELECT COUNT(*) FROM sales` in DuckDB and get a number?

**Difficulty:** ★★☆☆☆

---

## Week 2: Exploratory Data Analysis (Part 1)

**Objective:** Understand the structure of the data — what's there, what's missing, what's strange.

| # | Task | Output |
|---|------|--------|
| 1 | Sales data: distributions by store, family, date | Notebook cells |
| 2 | Missing value analysis | Missingness report |
| 3 | Temporal patterns: daily, weekly, monthly seasonality | Time series plots |
| 4 | Promotion analysis: frequency, distribution across families | Summary tables |
| 5 | Macro data: IPC trend, exchange rate trend, align dates | Overlay plots |

**Validation:** Can you describe 3 surprising things about this data?

**Difficulty:** ★★☆☆☆

---

## Week 3: EDA (Part 2) + Sampling Strategy

**Objective:** Select the subset you'll model and finish the EDA narrative.

| # | Task | Output |
|---|------|--------|
| 1 | Identify 3-5 store-family combinations with enough data | Selection rationale |
| 2 | Deep dive on selected subsets (trends, anomalies, promotions) | Detailed plots |
| 3 | Correlation between macro variables and sales (exploratory) | Scatter/heatmap |
| 4 | Write complete EDA notebook with narrative | `notebooks/01_eda_exploration.ipynb` |
| 5 | Write data dictionary | `docs/data_dictionary.md` |

**Deliverable:** ✅ `notebooks/01_eda_exploration.ipynb` — polished, narrative, publishable.

**Validation:** Could a stranger read this notebook and understand the data?

**Difficulty:** ★★★☆☆

**🏆 Quick Win:** Post one EDA visualization on LinkedIn with a brief insight. First portfolio signal.

---

## Week 4: Feature Engineering Pipeline

**Objective:** Build the reproducible transformation from raw data → modeling-ready features.

| # | Task | Output |
|---|------|--------|
| 1 | Calendar features (day of week, month, holiday flags, pay day) | `src/data/features.py` |
| 2 | Lag features (7d, 14d, 28d sales; rolling mean 7d, 28d) | Same module |
| 3 | Promotion features (on_promotion flag, promotion duration) | Same module |
| 4 | Macro features (IPC level, IPC change, FX level, FX change) | Same module |
| 5 | SQL views in DuckDB for key transformations | `sql/02_feature_views.sql` |
| 6 | Write feature engineering notebook | `notebooks/02_feature_engineering.ipynb` |

**Deliverable:** ✅ `src/data/features.py` + `notebooks/02_feature_engineering.ipynb`

**Validation:** `python -c "from src.data.features import build_features; df = build_features(); print(df.shape)"` works.

**Difficulty:** ★★★☆☆

---

## Week 5: Causal Inference — Theory & DAG

**Objective:** Understand causal inference well enough to specify a defensible causal graph.

| # | Task | Output |
|---|------|--------|
| 1 | Study: Chapters 1-5 of "Causal Inference for the Brave and True" | Notes |
| 2 | Study: Brady Neal lectures 1-4 | Notes |
| 3 | Define causal DAG for demand system | DAG diagram |
| 4 | Justify each edge in the DAG with domain knowledge | Written justification |
| 5 | Implement DAG in DoWhy | Code in `src/causal/dag.py` |

**Validation:** Can you explain to someone *why* each arrow in your DAG exists?

**Difficulty:** ★★★★☆ (conceptually the hardest week)

---

## Week 6: Causal Effect Estimation — Promotions

**Objective:** Estimate the causal effect of promotions on demand.

| # | Task | Output |
|---|------|--------|
| 1 | Set up DoWhy causal model for promotion → demand | Code |
| 2 | Estimate ATE (Average Treatment Effect) with Double ML | Effect estimate + CI |
| 3 | Estimate CATE (Conditional ATE) by product family | Heterogeneous effects |
| 4 | Run refutation tests (placebo, random common cause) | Refutation results |
| 5 | Visualize results | Effect plots |

**Deliverable:** "Promotions cause a X% (CI: Y% to Z%) increase in demand for beverages, but only W% for cleaning products."

**Validation:** Do your refutation tests support the estimate?

**Difficulty:** ★★★★☆

---

## Week 7: Causal Effects — Macro Variables + NLP Start

**Objective:** Extend causal analysis to macro variables. Begin NLP module in parallel.

| # | Task | Output |
|---|------|--------|
| 1 | Estimate exchange rate → demand causal effect | Effect estimate |
| 2 | Estimate IPC → demand causal effect | Effect estimate |
| 3 | Causal Forest for heterogeneous effects (R `grf`) | CATE by subgroup |
| 4 | **NLP:** Collect 50-100 economic news samples | Text corpus |
| 5 | **NLP:** Define event taxonomy (8-10 categories) | `src/nlp/taxonomy.py` |

**Difficulty:** ★★★★☆

---

## Week 8: NLP Event Detection + Causal Notebook

**Objective:** Complete the NLP pipeline and the causal analysis documentation.

| # | Task | Output |
|---|------|--------|
| 1 | Implement zero-shot classification pipeline | `src/nlp/classify.py` |
| 2 | Classify all collected news into event categories | Event dataset |
| 3 | Generate event features (category, date, intensity) | `src/nlp/events.py` |
| 4 | Write complete causal analysis notebook | `notebooks/03_causal_analysis.ipynb` |
| 5 | Write NLP event detection notebook | `notebooks/04_nlp_event_detection.ipynb` |

**Deliverables:** ✅ Two polished notebooks (causal + NLP)

**Validation:** Given a new news headline, does the pipeline classify it sensibly?

**Difficulty:** ★★★★☆

**🏆 Quick Win:** Post the causal DAG + one counterfactual finding on LinkedIn. This will generate significant engagement.

---

## Week 9: Forecasting Models

**Objective:** Build and compare forecasting models with and without causal/NLP features.

| # | Task | Output |
|---|------|--------|
| 1 | Implement baseline models (naive, seasonal naive) | `src/forecast/baseline.py` |
| 2 | Implement XGBoost with standard features only | `src/forecast/ml_models.py` |
| 3 | Implement XGBoost with standard + causal + NLP features | Same module |
| 4 | Build time series cross-validation framework | `src/forecast/evaluate.py` |
| 5 | Compare all models fairly | Comparison table |

**Difficulty:** ★★★☆☆

---

## Week 10: MVP — Model Comparison + Basic Dashboard

**Objective:** Complete the MVP. Working forecast comparison + basic interactive demo.

| # | Task | Output |
|---|------|--------|
| 1 | Finalize model comparison with proper metrics | `notebooks/05_forecasting_comparison.ipynb` |
| 2 | Document feature importance (causal vs standard features) | Importance plots |
| 3 | Build basic Streamlit app (2-3 pages) | `app/app.py` |
| 4 | Page 1: Forecast explorer (actual vs predicted) | Working page |
| 5 | Page 2: Causal drivers (DAG + effects) | Working page |

**Deliverable:** ✅ **MVP — working Streamlit app with forecast + causal analysis**

**Validation:** Can you show someone the app and explain the results in 3 minutes?

**🎯 MILESTONE: MVP COMPLETE**

---

## Week 11: Inventory Optimization

**Objective:** Translate causal analysis into actionable inventory recommendations.

| # | Task | Output |
|---|------|--------|
| 1 | Decompose forecast error into controllable vs uncontrollable | Analysis |
| 2 | Causal safety stock calculation | `src/inventory/safety_stock.py` |
| 3 | ABC-XYZ classification | `src/inventory/classification.py` |
| 4 | Service level vs cost trade-off curves | Visualization |
| 5 | Write inventory optimization notebook | `notebooks/06_inventory_optimization.ipynb` |

**Difficulty:** ★★★☆☆

---

## Week 12-13: Full Dashboard

**Objective:** Complete all Streamlit pages and deploy.

| # | Task | Output |
|---|------|--------|
| 1 | Page 3: Counterfactual simulator ("What if...?") | Interactive page |
| 2 | Page 4: Event timeline (NLP events + sales overlay) | Timeline page |
| 3 | Page 5: Inventory recommendations | Recommendations page |
| 4 | UI polish, caching, performance optimization | Improved app |
| 5 | Deploy to Streamlit Community Cloud | Public URL |
| 6 | Test with 2-3 people for feedback | User feedback |

**Deliverable:** ✅ Deployed Streamlit app at public URL

**Difficulty:** ★★★☆☆

---

## Week 14: Power BI + Polish

**Objective:** Create executive-level reporting and begin portfolio polish.

| # | Task | Output |
|---|------|--------|
| 1 | Build Power BI executive dashboard | `.pbix` file |
| 2 | Export Power BI visuals for LinkedIn/portfolio | Screenshots/PDF |
| 3 | Write unit tests for core modules | `tests/` |
| 4 | Code cleanup, remove dead code, add docstrings | Clean codebase |

**Difficulty:** ★★★☆☆

---

## Week 15: Documentation & Content

**Objective:** Transform the project into a professional portfolio piece.

| # | Task | Output |
|---|------|--------|
| 1 | Write professional README.md with architecture diagram | README |
| 2 | Record 2-minute demo video (Loom or OBS) | Video |
| 3 | Write LinkedIn post 1: "Why I built a causal demand system" | Published post |
| 4 | Write LinkedIn post 2: Key technical finding | Published post |
| 5 | Create GitHub release v1.0 | Tagged release |

**Difficulty:** ★★☆☆☆

---

## Week 16: Final Delivery

**Objective:** Final polish, optional enhancements, publication.

| # | Task | Output |
|---|------|--------|
| 1 | Set up GitHub Actions CI (linting + tests) | `.github/workflows/ci.yml` |
| 2 | Dockerfile (optional) | `Dockerfile` |
| 3 | Write LinkedIn post 3: Lessons learned | Published post |
| 4 | Final review of all documentation | All docs reviewed |
| 5 | Submit / present to professor if applicable | Presentation |

**Deliverable:** ✅ **COMPLETE PROJECT — Portfolio ready**

---

## Success Metrics Summary

| Metric | Target | How Measured |
|--------|--------|-------------|
| GitHub stars (vanity but motivating) | 5+ within first month | GitHub |
| LinkedIn post engagement | 50+ reactions on at least one post | LinkedIn |
| Streamlit app uptime | Accessible via public URL | Manual check |
| Code test coverage | > 50% for `src/` modules | pytest --cov |
| Notebooks complete | 6 polished notebooks | Manual review |
| Causal effects documented | 3+ with confidence intervals | Notebook 03 |
| Interview readiness | Can explain any part in < 2 minutes | Self-assessment |

---

## Contingency: Reduced Scope Version (12 weeks)

If time is constrained, deliver this reduced version:

| Keep | Drop |
|------|------|
| EDA + Data Engineering | Power BI report |
| Causal Analysis (core) | Docker |
| Forecasting comparison | NLP module (replace with manual event curation) |
| Basic Streamlit (3 pages) | Inventory optimization (mention as future work) |
| GitHub documentation | CI/CD pipeline |
| 2 LinkedIn posts | Demo video |

This still produces a strong portfolio piece. The causal analysis alone is the differentiator.
