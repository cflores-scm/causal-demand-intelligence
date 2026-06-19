# Project Charter — Causal Demand Intelligence System

**Project Name:** Causal Demand Intelligence with External Signal Detection  
**Author:** Christian Lorenzo Flores Lozano  
**Date:** June 2026  
**Version:** 1.0  
**Status:** Planning  

---

## 1. Business Problem Statement

### The Problem

Traditional demand forecasting in retail and CPG tells you **how much** demand to expect — but not **why** demand changes or **what you can do about it**.

A Demand Planner at a Peruvian retailer faces questions daily that standard forecasting cannot answer:

- "Sales dropped 12% last month. Was it because of the price increase, the exchange rate spike, or the political crisis?"
- "If we run a 20% promotion during Fiestas Patrias, how much incremental demand should we expect — net of what would have happened anyway?"
- "The BCRP just raised interest rates. Should we adjust our inventory positions?"

These are **causal questions** — they ask about the *effect* of interventions and external events on demand. Standard ML models (XGBoost, ARIMA, Prophet) identify correlations but cannot distinguish causation from coincidence. This leads to:

- **Misattributed demand drivers:** A promotion appears effective because it coincided with a holiday, not because of the discount itself.
- **Reactive planning:** Teams respond to demand changes after they appear in sales data, rather than anticipating them from external signals.
- **Suboptimal inventory decisions:** Safety stock is calculated from statistical error distributions, ignoring *which* sources of uncertainty are controllable vs. uncontrollable.

### Why This Matters for Supply Chain

| Impact Area | Traditional Approach | Causal Approach |
|---|---|---|
| Forecast accuracy | Predicts volume | Predicts volume + explains drivers |
| Promotion planning | "Last time we promoted, sales went up 15%" | "The promotion caused a 9% lift; the remaining 6% was seasonal" |
| Inventory policy | Uniform safety stock from forecast error | Differentiated safety stock based on controllable vs. uncontrollable uncertainty |
| External shocks | Adjusts after the fact | Detects early signals from news/macro data and quantifies expected impact |
| Stakeholder trust | "The model says X" | "The model says X because of Y, and here's the evidence" |

### Scope

- **In scope:** Demand forecasting, causal analysis of demand drivers, external event detection, inventory optimization informed by causal uncertainty, interactive dashboard.
- **Out of scope:** Real-time production system, supply-side optimization, logistics/transportation, pricing optimization engine.
- **Geography:** Peruvian retail market (using Corporación Favorita data as proxy for Andean region CPG retail).
- **Granularity:** Store-family level (not individual SKU level — computationally prohibitive and unnecessary for the demonstration).

---

## 2. Innovation Statement

### What Makes This Different

> **"Most forecasting projects answer 'how much.' This one answers 'why' and 'what if.'"**

This project combines three capabilities that rarely appear together — and almost never in student portfolios:

1. **Causal Machine Learning** (DoWhy + EconML): Not just predicting demand, but estimating the *causal effect* of specific variables (promotions, price, exchange rate, holidays) on demand. This enables counterfactual reasoning: "What *would have happened* without the promotion?"

2. **External Signal Detection via NLP**: Using pre-trained language models to extract demand-relevant signals from unstructured text (economic news, central bank communications). This captures information that time series alone cannot anticipate.

3. **Causally-Informed Inventory Optimization**: Safety stock and reorder points calculated not from generic forecast error, but from the decomposition of uncertainty into controllable factors (promotions, pricing) and uncontrollable factors (weather, political events, macro shocks).

### Differentiation vs. Traditional Portfolio Projects

| Typical GitHub Project | This Project |
|---|---|
| "Compared 7 forecasting models, XGBoost won" | "Identified that promotions cause 9% demand lift in beverages but only 2% in cleaning products, and that exchange rate shocks have asymmetric effects by price tier" |
| Dashboard shows historical accuracy | Dashboard lets you simulate "what if" scenarios with causal estimates |
| Uses only structured numerical data | Integrates unstructured text signals from economic news |
| Safety stock = f(forecast error) | Safety stock = f(controllable uncertainty, uncontrollable uncertainty) |
| R or Python, one language | Python (primary) + SQL + R (analytical) + Power BI (executive) |

---

## 3. Value Proposition for Recruiters

### Elevator Pitch (30 seconds)

*"I built a demand intelligence system that doesn't just forecast how much — it explains why demand changes and what you can do about it. It uses causal inference to separate real drivers from coincidences, NLP to detect early signals from economic news, and translates all of that into actionable inventory recommendations. The entire system runs on open-source tools, is deployed as an interactive web app, and is documented end-to-end on GitHub."*

### Skills Demonstrated

| Skill Category | Specific Competencies |
|---|---|
| **Programming** | Python, SQL, R, Git/GitHub |
| **Data Engineering** | ETL pipelines, DuckDB, data modeling, pipeline orchestration |
| **Machine Learning** | XGBoost, LightGBM, Causal Forests, time series cross-validation |
| **Causal Inference** | DAGs, DoWhy, EconML, Double ML, counterfactual estimation |
| **NLP / Gen AI** | HuggingFace Transformers, zero-shot classification, text-to-features pipeline |
| **Visualization** | Plotly, Streamlit, Power BI, matplotlib/seaborn |
| **Business Acumen** | Demand planning, inventory optimization, S&OP concepts, service level trade-offs |
| **Communication** | Narrative notebooks, executive dashboards, technical documentation |
| **DevOps Basics** | Docker, GitHub Actions, reproducible environments |

### Target Positions

| Position | Alignment | Key Selling Point |
|---|---|---|
| **Demand Planner** | ★★★★★ | Causal driver analysis + event detection = next-gen demand sensing |
| **Supply Chain Analyst** | ★★★★★ | Inventory optimization + causal uncertainty decomposition |
| **Supply Chain Data Analyst** | ★★★★★ | Python + SQL + ML + dashboards — the full technical stack |
| **SC Digital Transformation** | ★★★★☆ | Causal AI + NLP = frontier technologies in SC |
| **Operations Analytics** | ★★★★☆ | Decision support with causal evidence |
| **Data Scientist (Supply Chain)** | ★★★★★ | End-to-end ML pipeline with causal inference |

---

## 4. Success Criteria

### Minimum Viable Product (MVP)
- [ ] Clean, documented dataset with causal features engineered
- [ ] At least one causal effect estimated and validated (e.g., promotion effect on demand)
- [ ] Baseline vs. causal-enhanced forecasting comparison with proper evaluation
- [ ] Basic Streamlit dashboard showing causal drivers and counterfactual simulation
- [ ] GitHub repository with professional README and reproducible pipeline

### Full Project
- [ ] Complete causal discovery (DAG) with multiple demand drivers
- [ ] NLP event detection module processing real economic text
- [ ] Inventory optimization module with causal uncertainty decomposition
- [ ] Interactive Streamlit app deployed on free tier
- [ ] Power BI executive summary report
- [ ] 3+ LinkedIn posts documenting the journey
- [ ] Comprehensive GitHub documentation

### Quantitative Targets
- Forecast accuracy improvement of causal model vs. baseline: document honestly, even if marginal
- At least 3 causal effects estimated with confidence intervals
- Dashboard load time < 5 seconds
- Repository passes basic CI checks (linting, tests)

---

## 5. Constraints and Assumptions

### Constraints
- **Budget:** $0. All tools must be free/open-source.
- **Team:** Solo developer (1 person).
- **Timeline:** ~12 weeks for MVP, ~16 weeks for full project.
- **Compute:** Standard laptop (no GPU required for any component).
- **Data:** Publicly available datasets only.

### Assumptions
- Corporación Favorita dataset (Kaggle) is a reasonable proxy for Peruvian/Andean CPG retail dynamics.
- BCRP macroeconomic data is accessible via public API or downloadable CSVs.
- Economic news in Spanish can be processed with multilingual NLP models.
- Causal relationships estimated from observational data (no randomized experiments) — this limitation will be documented transparently.

### Risks and Mitigations

| Risk | Probability | Impact | Mitigation |
|---|---|---|---|
| Causal effects are statistically insignificant | Medium | High | Document honestly; the methodology is the differentiator, not the magnitude of effects |
| NLP module produces noisy signals | Medium | Medium | Use zero-shot classification (no training needed); validate against known events |
| Scope creep | High | High | Strict MVP definition; modular architecture allows dropping components |
| Dataset too large for laptop | Low | Medium | Sample strategically; use DuckDB for out-of-core processing |
| Learning curve too steep | Medium | Medium | Prioritized learning path; each module can stand alone |

---

## 6. Stakeholders

| Stakeholder | Interest | How We Serve Them |
|---|---|---|
| **Recruiters** | Technical skills, business acumen, communication | Professional GitHub repo, deployed app, LinkedIn content |
| **University Professors** | Methodological rigor, innovation | Documented methodology, references to academic literature |
| **SC Professionals** | Practical applicability, business value | Business-oriented dashboard, actionable recommendations |
| **The Developer (You)** | Learning, portfolio impact, career differentiation | Structured learning path, progressive complexity |
