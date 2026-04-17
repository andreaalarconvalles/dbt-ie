# Analytics Engineering with dbt - Course Syllabus

## Course Overview

This is a comprehensive 15-session course designed to take students from SQL basics to advanced analytics engineering with dbt. The course covers end-to-end data pipeline development, from raw data ingestion to interactive dashboards, specifically tailored to cover all domains of the dbt Analytics Engineering Certification.

## Learning Objectives

- Master dbt fundamentals and project structure
- Build robust data transformation pipelines
- Implement testing and documentation best practices
- Work with modern data stack tools (DuckDB)
- Apply analytics engineering principles to real-world scenarios
- Prepare for the dbt Analytics Engineering Certification

---

## Session 1: Intro to Analytics Engineering, dbt & Project Structure

### Learning Objectives

- What is Analytics Engineering?
- The relationship between SQL, Python, and dbt
- What is dbt and how does it work? (Compiler & Runner)
- Understanding the compilation process (`target/compiled` vs `target/run`)
- Project folder structure (models, seeds, tests, analyses, macros)
- Defining configurations in `dbt_project.yml`

### Activities

- Explore the dbt project configuration
- Configure model materializations at directory and file levels
- Inspect `target/compiled` and `target/run` to understand dbt's compilation logic

---

## Session 2: Tooling & First Models

### Learning Objectives

- Introduction to DuckDB: Our Course Database
- Git Workflow: Forking and Cloning the Repository
- The VS Code IDE & dbt Power User Extension

### Activities

- Fork the course repository and clone to local machine
- Install dependencies and configure the dbt profile
- Connect to the DuckDB database
- Install and configure the VSCode dbt Power User extension

---

## Session 3: Sources, Seeds & Dependencies

### Learning Objectives

- Configuring sources in dbt
- Identifying and verifying raw object dependencies
- Working with Seeds (`dbt seed`)
- Implementing source freshness
- Implementing and Maintaining External Dependencies
- Creating Staging Models from Raw Sources

### Activities

- Define sources in `sources.yml`
- Load static data with seeds
- Run `dbt source freshness` and debug failures
- Create `stg_customers` and `stg_orders` models from raw sources

---

## Session 4: Modeling: SQL, Modularity, DRY & Python Models

### Learning Objectives

- Dimensional Modeling (Star Schema)
- Conceptualizing modularity and incorporating DRY principles
- Converting business logic into performant SQL queries
- Creating Python Models in dbt
- Creating a logical flow of models and building clean DAGs

### Activities

- Design the Intermediate and Marts layers
- Create a dbt Python model for non-SQL transformations
- Refactor legacy SQL into modular dbt models

---

## Session 5: Practice Session I: Building the Foundation

### Learning Objectives

- **Hands-on Workshop**: Consolidating knowledge from Sessions 1-4
- Setting up a robust Staging Layer
- Building Intermediate and Marts layers
- Implementing best practices for Source configuration
- Debugging initial setup issues

### Activities

- Build the complete Staging Layer for the ecommerce dataset
- Configure all Sources and Seeds
- Create Intermediate models for joins and transformations
- Build Final Marts (Facts and Dimensions)
- Verify Source Freshness

---

## Session 6: Materializations & Grants

### Learning Objectives

- Understanding core dbt materializations (view, table, ephemeral)
- Providing access to users with the `grants` config
- Trade-offs between materialization types
- Defining configurations in `dbt_project.yml`

### Activities

- Configure different materializations for models
- Implement grants for specific roles
- Analyze build logs for different materializations

---

## Session 7: Jinja, Macros & Packages

### Learning Objectives

- Using dbt Packages (dbt-utils, codegen)
- Jinja templating fundamentals
- Creating reusable Macros
- Utilizing git functionality within the development lifecycle

### Activities

- Install `dbt-utils` package
- Create a custom macro
- Use package macros for surrogate keys and date spines

---

## Session 8: Practice Session II: Advanced Modeling & Refactoring

### Learning Objectives

- **Hands-on Workshop**: Consolidating knowledge from Sessions 6-7
- Refactoring "Spaghetti SQL" into modular dbt models
- Implementing complex business logic using Macros and Python
- Optimizing the DAG

### Activities

- Build the Intermediate Layer (Joins, Pivots)
- Build the Final Marts (Facts, Dimensions)
- Implement a custom Macro for repeated logic
- Visualize and audit the full Lineage Graph

---

## Session 9: Testing, Documentation & Exposures

### Learning Objectives

- Implementing dbt tests (generic, singular, custom)
- Testing assumptions for dbt models and sources
- Creating and maintaining dbt documentation
- Implementing dbt exposures
- Implementing various testing steps in the workflow

### Activities

- Apply generic tests (unique, not_null)
- Write singular SQL tests
- Generate docs site (`dbt docs generate`)
- Define an exposure for a dashboard

---

## Session 10: Advanced Materializations: Incremental & Snapshots

### Learning Objectives

- Deep dive into Incremental models
- Leveraging Snapshots for SCD Type 2
- Configuring incremental strategies
- Managing large datasets efficiently

### Activities

- Convert a large table model to incremental
- Create a snapshot for a mutable source
- Test incremental logic

---

## Session 11: Model Governance: Contracts, Versions & Access

### Learning Objectives

- Understanding dbt models governance
- Adding contracts to models to ensure shape
- Creating different versions of models and deprecating old ones
- Configuring Model Access (Public/Private/Protected)

### Activities

- Add a contract to a model
- Version a model and define a deprecation date
- Restrict access to a model

---

## Session 12: Practice Session III: Quality, Governance & Evolution

### Learning Objectives

- **Hands-on Workshop**: Consolidating knowledge from Sessions 9-11
- Hardening the project with comprehensive Tests and Contracts
- Managing Model Evolution and Deprecation
- Implementing Snapshots for historical tracking

### Activities

- Implement a full Test Suite for the Marts
- Add Contracts to critical models
- Create a Snapshot strategy for the `orders` table
- Simulate a schema change and handle it with Versioning

---

## Session 13: State, Pipelines & Debugging

### Learning Objectives

- Leveraging the dbt state (state, retry, selectors)
- Managing data pipelines and failure points
- Using `dbt clone`
- Debugging data modeling errors (Logs, Compiled Code)
- Distinguishing between dbt core and platform errors

### Activities

- Run dbt with `--state` and `state:modified`
- Use `dbt retry` after a failure
- Debug intentional errors using `dbt.log` and compiled SQL

---

## Session 14: Deployment, Jobs & Orchestration

### Learning Objectives

- Understanding dbt Cloud Deployment concepts (Environments, Jobs)
- Setting up CI/CD workflows (Slim CI)
- Orchestration fundamentals
- Troubleshooting errors in production

### Activities

- Simulate a deployment workflow (Build -> Test -> Deploy)
- Discuss dbt Cloud Job configuration
- Implement a "Slim CI" check using `state:modified`

---

## Session 15: Certification Prep & Final Review

### Learning Objectives

- Comprehensive review
- Exam strategy and question analysis
- Best Practices Recap

### Activities

- Mock Exam Questions Walkthrough
- Review key tricky topics
- Final Q&A

---

## Prerequisites

- Basic SQL knowledge
- Python programming fundamentals
- Understanding of data concepts
- Git version control familiarity

## Tools & Technologies

- dbt Core (Hands-on) & dbt Cloud (Conceptual)
- DuckDB - Analytical database
- Git/GitHub - Version control
- VS Code - Development environment
