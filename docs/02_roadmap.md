# Roadmap & Chronogram

**Project:** Causal Demand Intelligence System  
**Total Duration:** 16 weeks (~4 months)  
**Effort:** 10-15 hours/week (student schedule)  
**MVP Target:** Week 10  
**Final Version:** Week 16  

---

## Project Phases Overview

```
Week  1  2  3  4  5  6  7  8  9  10  11  12  13  14  15  16
      ├──────────┤                                            Phase 0: Foundation
               ├────────────┤                                 Phase 1: Data Engineering
                        ├──────────────┤                      Phase 2: Causal Analysis
                                    ├────────────┤            Phase 3: NLP & Event Detection
                                          ├──────────────┤    Phase 4: Forecasting & Inventory
                                                   ├────────┤ Phase 5: Dashboard & Deploy
                                                      ├─────┤ Phase 6: Portfolio & Publication
                                                             
                              MVP ──────────────► Week 10
                              FULL ─────────────► Week 16
```

---

## Phase 0: Foundation & Setup (Weeks 1-3)

**Objective:** Establish the technical environment, acquire all data, and perform initial exploration to validate that the project is feasible.

| Activity | Duration | Difficulty | Tools |
|----------|----------|------------|-------|
| Set up Python environment (venv/conda) | Day 1 | Low | Python, pip |
| Set up project structure (cookiecutter) | Day 1 | Low | Git, GitHub |
| Download Corporación Favorita dataset | Day 1 | Low | Kaggle API |
| Download BCRP macroeconomic data | Day 2 | Low | BCRP API / web |
| Load data into DuckDB, write SQL schemas | Week 1 | Medium | DuckDB, SQL |
| Exploratory Data Analysis — structure | Week 2 | Medium | Python, Jupyter |
| EDA — distributions, missing values, patterns | Week 2-3 | Medium | pandas, plotly |
| Data sampling strategy (select stores/families) | Week 3 | Medium | SQL, pandas |
| Document data dictionary | Week 3 | Low | Markdown |

**Deliverables:**
- ✅ Working development environment
- ✅ All data acquired and loaded into DuckDB
- ✅ EDA notebook with key findings
- ✅ Data dictionary
- ✅ Sampling strategy documented (which stores/families to focus on)

**Exit Criteria:** You can answer: "What does this data look like? What are its limitations? What subset will I work with and why?"

**Risks:**
- Favorita dataset is 125M+ rows → Mitigation: DuckDB handles this efficiently; sample to ~5 store-family combinations for modeling.

**🏆 Quick Win:** The EDA notebook alone, if well-crafted, is a portfolio piece. Post a visualization on LinkedIn.

---

## Phase 1: Data Engineering Pipeline (Weeks 3-5)

**Objective:** Build a reproducible ETL pipeline that transforms raw data into analysis-ready features.

| Activity | Duration | Difficulty | Tools |
|----------|----------|------------|-------|
| Design feature engineering pipeline | Week 3 | Medium | Python |
| Calendar features (holidays, weekdays, pay days) | Week 3-4 | Low | pandas |
| Lag features (7d, 14d, 28d, rolling means) | Week 4 | Medium | pandas |
| Integrate macro data (IPC, exchange rate) | Week 4 | Medium | SQL, pandas |
| Build modular ETL scripts | Week 4-5 | Medium | Python |
| Write SQL transformations in DuckDB | Week 4-5 | Medium | SQL |
| Data validation and quality checks | Week 5 | Medium | Python |
| Unit tests for feature engineering | Week 5 | Medium | pytest |

**Deliverables:**
- ✅ `src/data/` module with ETL pipeline
- ✅ Feature-engineered dataset stored in DuckDB
- ✅ SQL scripts for key transformations
- ✅ Data validation report
- ✅ Basic unit tests

**Exit Criteria:** Running one command produces a clean, feature-rich dataset ready for modeling.

**🏆 Quick Win:** The SQL + Python ETL pipeline demonstrates data engineering skills immediately recognizable by recruiters.

---

## Phase 2: Causal Analysis (Weeks 5-8) ⭐ Core Differentiator

**Objective:** Discover and estimate causal relationships between demand drivers and sales.

| Activity | Duration | Difficulty | Tools |
|----------|----------|------------|-------|
| Learn DoWhy + EconML fundamentals | Week 5 | High | DoWhy docs, tutorials |
| Define causal DAG (domain knowledge) | Week 5-6 | High | DoWhy, networkx |
| Estimate promotion → demand causal effect | Week 6 | High | EconML (Double ML) |
| Estimate price → demand causal effect | Week 6-7 | High | EconML |
| Estimate macro variables → demand effects | Week 7 | High | EconML, Causal Forest |
| Robustness checks (refutation tests) | Week 7-8 | High | DoWhy |
| Counterfactual estimation | Week 8 | High | EconML |
| Document findings in narrative notebook | Week 8 | Medium | Jupyter |

**Deliverables:**
- ✅ Causal DAG visualization with justification
- ✅ Estimated causal effects with confidence intervals for 3+ drivers
- ✅ Refutation test results (placebo, random common cause, subset)
- ✅ Counterfactual analysis notebook ("what if promotion hadn't happened?")
- ✅ Causal analysis report

**Exit Criteria:** You can say: "Promotions cause a X% (±Y%) increase in demand for category Z, and here are the robustness checks that support this claim."

**Risks:**
- Causal effects may be weak or insignificant → Mitigation: This is a valid finding. Document it honestly. The *methodology* is the differentiator.
- DAG specification requires domain knowledge → Mitigation: Use literature + data-driven discovery (PC algorithm) as starting point.

**🏆 Quick Win:** A well-made causal DAG visualization + one counterfactual analysis = a LinkedIn post that will generate significant engagement.

**💡 This is the hardest phase.** Budget extra time here. If you get stuck, the learning path (doc 03) has specific resources.

---

## Phase 3: NLP & External Event Detection (Weeks 7-9)

**Objective:** Build a pipeline that extracts demand-relevant signals from unstructured economic text.

| Activity | Duration | Difficulty | Tools |
|----------|----------|------------|-------|
| Collect sample economic texts (BCRP, news) | Week 7 | Low | Web scraping, requests |
| Learn HuggingFace zero-shot classification | Week 7 | Medium | transformers |
| Define event taxonomy (inflation, strike, etc.) | Week 7-8 | Medium | Domain knowledge |
| Build classification pipeline | Week 8 | Medium | Python, transformers |
| Convert event classifications to features | Week 8-9 | Medium | pandas |
| Validate against known historical events | Week 9 | Medium | Manual verification |
| Integrate event features with main dataset | Week 9 | Medium | Python, SQL |

**Deliverables:**
- ✅ Event taxonomy document
- ✅ NLP classification pipeline (reusable module)
- ✅ Event timeline visualization
- ✅ Event features integrated into modeling dataset

**Exit Criteria:** Given a news headline about Peru's economy, the pipeline classifies it and generates a structured feature vector.

**Risks:**
- Spanish NLP models may underperform → Mitigation: Use multilingual models (`joeddav/xlm-roberta-large-xnli`); pre-test with known events.
- News data may be hard to scrape → Mitigation: BCRP publishes structured reports; worst case, manually curate 50-100 events for demonstration.

**Note:** This phase overlaps with Phase 2 intentionally — you can work on NLP data collection while waiting for causal analysis results.

---

## Phase 4: Forecasting & Inventory Optimization (Weeks 8-11)

**Objective:** Build forecasting models that incorporate causal and NLP features, and translate forecasts into inventory decisions.

| Activity | Duration | Difficulty | Tools |
|----------|----------|------------|-------|
| Baseline models (naive, seasonal naive) | Week 8 | Low | Python |
| XGBoost/LightGBM with standard features | Week 9 | Medium | scikit-learn, xgboost |
| XGBoost/LightGBM with causal + NLP features | Week 9-10 | Medium | xgboost, lightgbm |
| Time series cross-validation framework | Week 9 | Medium | scikit-learn |
| Model comparison (fair evaluation) | Week 10 | Medium | Python |
| **── MVP CHECKPOINT ──** | **Week 10** | | |
| Safety stock with causal uncertainty decomposition | Week 10-11 | High | Python, scipy |
| Reorder point optimization | Week 11 | Medium | Python |
| ABC-XYZ classification | Week 11 | Medium | Python |
| Service level vs. cost trade-off analysis | Week 11 | Medium | Python, plotly |

**Deliverables:**
- ✅ Model comparison report with proper evaluation metrics
- ✅ Feature importance analysis (standard vs. causal features)
- ✅ Inventory optimization recommendations
- ✅ Service level trade-off visualization

**Exit Criteria (MVP — Week 10):** You have a working forecast model, a causal analysis with at least one validated effect, and a basic comparison showing the value (or honest limitation) of causal features.

---

## Phase 5: Dashboard & Deployment (Weeks 11-14)

**Objective:** Build an interactive application that communicates results to technical and non-technical audiences.

| Activity | Duration | Difficulty | Tools |
|----------|----------|------------|-------|
| Design dashboard wireframes | Week 11 | Low | Paper/Figma |
| Streamlit app — forecast explorer page | Week 11-12 | Medium | Streamlit, plotly |
| Streamlit app — causal drivers page | Week 12 | Medium | Streamlit |
| Streamlit app — counterfactual simulator | Week 12-13 | High | Streamlit, EconML |
| Streamlit app — event timeline page | Week 13 | Medium | Streamlit |
| Streamlit app — inventory recommendations page | Week 13 | Medium | Streamlit |
| Deploy to Streamlit Community Cloud | Week 13 | Low | Streamlit Cloud |
| Power BI executive summary (optional) | Week 14 | Medium | Power BI Desktop |
| User testing and refinement | Week 14 | Low | Manual |

**Deliverables:**
- ✅ Deployed Streamlit application (public URL)
- ✅ Power BI report (PDF/screenshots for LinkedIn)
- ✅ Dashboard documentation

**🏆 Quick Win:** A deployed Streamlit app with a public URL is immediately impressive in any interview.

---

## Phase 6: Portfolio Polish & Publication (Weeks 14-16)

**Objective:** Transform the project from "working code" into "professional portfolio piece."

| Activity | Duration | Difficulty | Tools |
|----------|----------|------------|-------|
| Write professional README.md | Week 14 | Medium | Markdown |
| Create architecture diagram | Week 14 | Low | Mermaid/draw.io |
| Record 2-minute demo video | Week 15 | Medium | OBS/Loom |
| Write LinkedIn post series (3-4 posts) | Week 15 | Medium | LinkedIn |
| Final code cleanup and documentation | Week 15-16 | Medium | All |
| Add GitHub Actions CI (linting, tests) | Week 16 | Medium | GitHub Actions |
| Docker containerization (optional) | Week 16 | Medium | Docker |
| Final review and publication | Week 16 | Low | GitHub |

**Deliverables:**
- ✅ Professional GitHub repository
- ✅ LinkedIn post series published
- ✅ Demo video
- ✅ Portfolio-ready project

---

## Milestone Summary

| Milestone | Week | Description |
|-----------|------|-------------|
| 🟢 **Environment Ready** | 1 | Dev environment, data acquired |
| 🟢 **EDA Complete** | 3 | Data understood, subset selected |
| 🟢 **Pipeline Built** | 5 | Reproducible ETL from raw → features |
| 🟡 **First Causal Effect** | 6 | One causal relationship estimated and validated |
| 🟡 **NLP Pipeline Working** | 9 | Event detection producing structured features |
| 🔴 **MVP** | 10 | Working forecast + causal analysis + basic dashboard |
| 🔴 **Full Dashboard** | 13 | Deployed interactive application |
| 🔴 **Portfolio Ready** | 16 | Published, documented, LinkedIn posts live |

---

## Dependencies Between Phases

```
Phase 0 (Foundation)
    │
    ├──► Phase 1 (Data Engineering) ──► Phase 4 (Forecasting)
    │                                       │
    │                                       ├──► Phase 5 (Dashboard)
    │                                       │
    ├──► Phase 2 (Causal Analysis) ─────────┤
    │                                       │
    └──► Phase 3 (NLP Events) ──────────────┘
                                                  │
                                                  └──► Phase 6 (Portfolio)
```

**Key insight:** Phases 2 and 3 can run in parallel after Phase 0 is complete. Phase 4 needs outputs from both. This is the critical path.

---

## What To Do If You Fall Behind

| Situation | Action |
|-----------|--------|
| Phase 2 (Causal) takes longer than expected | Reduce to 1-2 causal effects instead of 3+. Quality over quantity. |
| Phase 3 (NLP) is too difficult | Use manually curated event data instead of automated NLP. Document the manual process as "ground truth" and the NLP as "automation layer." |
| Phase 4 (Forecasting) isn't showing improvement | Document honestly. "Causal features didn't improve MAPE, but they enabled counterfactual reasoning that pure prediction cannot provide." The methodology matters more than the metric. |
| Total time exceeds 16 weeks | Deliver MVP (Week 10) as v1.0. Continue to full version as v2.0. A shipped MVP beats an unfinished masterpiece. |
