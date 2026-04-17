# Analytics Engineering with dbt - Course Syllabus
## Aligned with dbt Fundamentals Certification

## Course Overview

This is a comprehensive 15-session course designed to prepare students for the dbt Analytics Engineering Certification. The course mirrors the dbt Fundamentals certification structure while providing hands-on experience with dbt Core and DuckDB. Students will master the complete analytics engineering workflow from raw data to production deployment.

## Learning Objectives

- Master dbt fundamentals and the Analytics Development Lifecycle (ADLC)
- Build production-ready data transformation pipelines
- Implement comprehensive testing and documentation strategies
- Apply governance principles with contracts, versions, and access controls
- Leverage state management for efficient CI/CD workflows
- Debug and troubleshoot dbt projects systematically
- Prepare for and pass the dbt Analytics Engineering Certification exam

---

## Session 1: Introduction to Analytics Engineering & Course Overview

### Learning Objectives

- Understand what Analytics Engineering is and its role in the Modern Data Stack
- Learn the Analytics Development Lifecycle (ADLC)
- Understand ELT vs ETL paradigms
- Explore data team roles and responsibilities
- Introduction to dbt as the data control plane
- Overview of the dbt Fundamentals certification structure
- Course logistics and project overview

### Activities

- Review the ADLC and how dbt fits into modern data workflows
- Explore the dbt ecosystem and community
- Understand certification exam structure and domains
- Set expectations for the course project

### Certification Alignment

- **dbt Fundamentals Module**: Analytics Development Lifecycle (30 min)
- **Certification Domains**: Foundation for all 8 domains

---

## Session 2: Setting Up dbt & Building First Models

### Learning Objectives

- Set up the development environment (DuckDB, VS Code, dbt Power User)
- Understand dbt project structure (`dbt_project.yml`, models, tests, seeds, macros)
- Learn the dbt compilation process (`target/compiled` vs `target/run`)
- Build your first dbt model
- Understand modularity and the `ref()` macro
- Learn dbt commands: `run`, `compile`, `build`
- Introduction to naming conventions and project organization

### Activities

- Fork and clone the course repository
- Install dependencies and configure dbt profile for DuckDB
- Generate sample ecommerce data and load into DuckDB
- Install VS Code dbt Power User extension
- Create your first staging model
- Use `ref()` to create model dependencies
- Explore the compiled SQL in `target/`

### Certification Alignment

- **dbt Fundamentals Module**: Set Up dbt (60 min) + Models (60 min)

---

## Session 3: Sources, Seeds, Dependencies & First Tests

### Learning Objectives

- Configuring sources in dbt with YAML
- Identifying and verifying raw object dependencies
- Working with seeds for static reference data
- Implementing source freshness checks
- Building staging models from raw sources
- Using the Codegen package to generate boilerplate code
- Understanding the staging layer pattern
- Introduction to generic tests (`unique`, `not_null`) on sources and staging models
- Introduction to `dbt build` to run models and tests together in DAG order

### Activities

- Define sources in `sources.yml`
- Load CSV data with `dbt seed`
- Configure and run `dbt source freshness`
- Install and use the codegen package
- Generate staging models for all source tables
- Standardize column names and data types in staging
- Add `unique` and `not_null` tests to staging model primary keys
- Run `dbt build` to execute models and tests together
- Clean and document the staging layer

### Certification Alignment

- **dbt Fundamentals Module**: Sources (60 min) + Data Tests introduction
- **Certification Domain**: Implementing dbt tests (generic tests), External dependencies (source freshness)

---

## Session 4: Data Modeling & Modularity

### Learning Objectives

- Understand dimensional modeling (Star Schema: Facts & Dimensions)
- Apply the DRY (Don't Repeat Yourself) principle
- Design the three-layer architecture: Staging → Intermediate → Marts
- Convert business logic into performant SQL
- Create a logical flow of models and build clean DAGs
- Introduction to Python models in dbt
- Visualize and understand the lineage graph

### Activities

- Design the dimensional model for the ecommerce project
- Build intermediate models for business logic (joins, aggregations)
- Create fact tables (e.g., `mart_orders`) and dimension tables (e.g., `dim_customers`)
- Implement a Python model for advanced transformations
- Add generic tests to new models as they are built
- Visualize the full DAG and verify dependencies
- Refactor SQL to improve modularity

### Certification Alignment

- **Certification Domain**: Developing dbt models (Modularity, DRY, SQL, DAGs)

---

## Session 5: Practice Session I - Building the Foundation

### Learning Objectives

- **Hands-on Workshop**: Consolidate knowledge from Sessions 1-4
- Build a complete staging layer
- Implement intermediate transformations
- Create production-ready marts
- Verify source freshness and dependencies
- Debug common setup and modeling issues

### Activities

- Complete staging models for all source tables
- Build intermediate models: `int_order_items_summary`, `int_order_shipping`
- Create marts: `mart_orders`, `dim_customers`, `dim_products`
- Add generic tests (unique, not_null, relationships) to all models
- Run `dbt build` and verify all models and tests pass
- Verify all model dependencies with the lineage graph
- Run `dbt source freshness` and interpret results
- Debug and fix any DAG issues

### Certification Alignment

- **Practice applying**: Models, Sources, Modularity, DAG creation, basic testing

---

## Session 6: Materializations & Configuration

### Learning Objectives

- Understand core dbt materializations (view, table, ephemeral, incremental)
- Learn trade-offs between materialization types
- Configure materializations at project and model levels
- Provide access to users with the `grants` config
- Define configurations in `dbt_project.yml`
- Understand performance implications of different strategies

### Activities

- Configure different materializations for each layer:
  - Staging: views
  - Intermediate: ephemeral or tables
  - Marts: tables
- Implement grants for specific roles/users
- Analyze build logs and execution times
- Configure directory-level settings in `dbt_project.yml`
- Test materialization changes with `dbt run`

### Certification Alignment

- **Certification Domain**: Understanding core dbt materializations, grants config
- **dbt Fundamentals**: Covered in Models module

---

## Session 7: Jinja, Macros & Packages

### Learning Objectives

- Master Jinja templating fundamentals
- Create custom macros for reusable logic
- Use dbt packages (dbt-utils, dbt-expectations, codegen)
- Understand the dbt Hub and package ecosystem
- Apply custom and package macros in models
- Utilize git functionality within the development lifecycle

### Activities

- Install packages via `packages.yml` and `dbt deps`
- Use dbt-utils macros: `generate_surrogate_key()`, `union_relations()`
- Create a custom macro for repeated business logic
- Use dbt-expectations for advanced data quality tests
- Generate YAML and SQL with codegen
- Practice git workflow: branch, commit, push, PR

### Certification Alignment

- **Certification Domain**: Using dbt Packages, utilizing git functionality

---

## Session 8: Practice Session II - Advanced Modeling & Refactoring

### Learning Objectives

- **Hands-on Workshop**: Consolidate knowledge from Sessions 6-7
- Refactor "spaghetti SQL" into modular dbt models
- Implement complex business logic using macros and Jinja
- Optimize the DAG for performance and maintainability
- Use packages to simplify common transformations

### Activities

- Refactor a monolithic SQL query into multiple dbt models
- Build intermediate models with complex joins and pivots
- Create a custom macro for revenue calculation logic
- Use dbt-utils to generate surrogate keys
- Apply dbt-expectations tests for data quality validation
- Audit and optimize the lineage graph
- Measure and compare build times

### Certification Alignment

- **Practice applying**: Modularity, Macros, Packages, DAG optimization

---

## Session 9: Advanced Testing, Documentation & Exposures

### Learning Objectives

- Deepen testing skills beyond generic tests
- Write singular tests for custom business logic
- Create custom generic tests (reusable test macros)
- Apply `accepted_values` and `relationships` tests
- Use dbt-expectations for advanced data validation
- Create comprehensive documentation with YAML
- Write doc blocks for complex descriptions
- Define exposures to document downstream consumers
- Generate and explore the documentation site

### Activities

- Write singular tests for business rules (e.g., order totals, date ranges)
- Create a custom generic test macro for reusable validation
- Apply `accepted_values` and `relationships` tests across models
- Document all models, columns, and sources in YAML
- Write doc blocks for complex metrics
- Define an exposure for a downstream dashboard (YAML config, DAG visibility)
- Generate the docs site with `dbt docs generate` and `dbt docs serve`
- Explore model lineage and documentation in the docs site

### Certification Alignment

- **dbt Fundamentals Module**: Data Tests (60 min) + Documentation (40 min)
- **Certification Domain**: Implementing dbt tests (singular, custom generic), Creating documentation, External dependencies (exposures)

---

## Session 10: Advanced Materializations - Incremental Models & Snapshots

### Learning Objectives

- Deep dive into incremental models
- Understand incremental strategies (append, merge, delete+insert)
- Configure unique keys and incremental logic
- Use `is_incremental()` macro
- Implement snapshots for SCD Type 2 tracking
- Manage large datasets efficiently
- Debug incremental model issues

### Activities

- Convert `mart_orders` to an incremental model
- Implement different incremental strategies
- Test incremental logic with `--full-refresh`
- Create a snapshot for tracking customer changes over time
- Implement timestamp-based vs check-column strategies
- Verify snapshot functionality
- Analyze performance improvements

### Certification Alignment

- **Certification Domain**: Understanding core dbt materializations (incremental)

---

## Session 11: Model Governance - Contracts, Versions & Access

### Learning Objectives

- Understand dbt model governance principles
- Add contracts to models to enforce schema
- Define data types and constraints
- Create different versions of models
- Deprecate old model versions
- Configure model access (public, private, protected)
- Understand breaking vs non-breaking changes

### Activities

- Add a contract to `dim_customers` with data types and constraints
- Version a model and define deprecation dates
- Configure access levels for different model types
- Simulate a schema change and handle with versioning
- Test contract enforcement (intentional failures)
- Document governance policies

### Certification Alignment

- **Certification Domain**: Understanding dbt model governance (contracts, versions, access)

---

## Session 12: Practice Session III - Production-Ready Data Quality

### Learning Objectives

- **Hands-on Workshop**: Consolidate knowledge from Sessions 9-11
- Build comprehensive testing strategies
- Implement governance features in production models
- Use incremental models for large fact tables
- Create snapshots for historical tracking
- Use `dbt build` for integrated workflows

### Activities

- Implement a full test suite across all layers:
  - Staging: source freshness, generic tests
  - Intermediate: relationship tests, singular tests
  - Marts: all generic tests, custom generic tests, business rule tests
- Add contracts to all mart models
- Convert large tables to incremental materialization
- Create snapshots for slowly changing dimensions
- Version a critical model and migrate consumers
- Run `dbt build` with different selectors
- Debug test failures and refine logic

### Certification Alignment

- **Practice applying**: Testing, Contracts, Incremental models, Snapshots, build command

---

## Session 13: State, Debugging, Deployment & CI/CD

### Learning Objectives

- Understand and leverage dbt state
- Use state selectors (`state:modified`, `state:new`)
- Implement `dbt retry` for re-running failed nodes
- Combine state and result selectors (`result:error`, `result:fail`)
- Use `dbt clone` for environment management
- Debug data modeling errors systematically
- Understand logged error messages
- Troubleshoot using compiled code
- Troubleshoot YAML compilation errors
- Distinguish between dbt and database errors
- Troubleshoot and manage DAG failure points
- Troubleshoot errors from integrated tools
- Understand deployment concepts (environments, jobs)
- Configure development vs production environments
- Implement CI/CD workflows and Slim CI with state
- Explore the dbt Catalog for data discovery

> **Note**: Deployment and CI/CD topics cover dbt Cloud concepts conceptually, as the certification exam tests these topics. Hands-on work focuses on CI/CD patterns applicable to dbt Core (e.g., GitHub Actions, state-based selectors).

### Activities

- Run dbt with `--state` to detect modified models
- Use `state:modified+` to rebuild downstream dependencies
- Simulate failures and practice `dbt retry`
- Use result selectors (`result:error+`) to re-run failed nodes and their downstream
- Clone data between dev and prod environments with `dbt clone`
- Debug intentional errors:
  - SQL syntax errors in models
  - YAML configuration errors
  - Circular dependency errors
  - Database connection issues
  - Developing, implementing, and testing fixes before merging
- Analyze `logs/dbt.log` and compiled SQL
- Fix errors and verify solutions
- Configure a production environment
- Set up a scheduled dbt job with:
  - Model building
  - Testing
  - Documentation generation
  - Source freshness checks
- Review job run results
- Explore the dbt Catalog (conceptual — dbt Cloud feature)
- Implement a "Slim CI" workflow using `state:modified`
- Practice deployment workflows (dev → staging → prod)

### Certification Alignment

- **dbt Fundamentals Module**: Deployment (30 min)
- **Certification Domain**: Leveraging dbt state (state, retry, result selectors), Debugging errors, Managing pipelines (DAG failure points, dbt clone, integrated tools, deployment, CI/CD)

---

## Session 14: Q&A & Comprehensive Review

### Learning Objectives

- Address student questions across all course topics
- Review and reinforce challenging concepts from Sessions 1–13
- Identify and fill knowledge gaps before certification prep
- Final project review and feedback
- Best practices recap across the full dbt workflow

### Activities

- Open Q&A session covering all topics from Sessions 1–13
- Student-driven review of challenging areas
- Walk through common pitfalls and misconceptions:
  - Incremental logic and strategies
  - Snapshot configurations
  - State and result selectors
  - Contract enforcement
  - Custom generic tests
  - Exposures and source freshness
  - dbt Cloud deployment concepts
- Review and provide feedback on student projects
- Collaborative debugging exercises on student-submitted issues
- Best practices recap: naming conventions, DAG design, testing strategy, documentation

### Certification Alignment

- **All Certification Domains**: Review and reinforcement based on student needs

---

## Session 15: Certification Prep

### Learning Objectives

- Comprehensive review of all 8 certification domains
- Exam strategy and question analysis
- How to practice the exam
- Identify remaining weak areas and targeted review

### Activities

- Review certification exam structure 
- Domain-by-domain review:
  1. Developing dbt models
  2. Understanding dbt model governance
  3. Debugging data modeling errors
  4. Managing data pipelines
  5. Implementing dbt tests
  6. Creating and maintaining documentation
  7. Implementing external dependencies
  8. Leveraging dbt state
- Final Q&A session on exam preparation
- Next steps and resources

### Certification Alignment

- **dbt Fundamentals Module**: Survey and Next Steps (5 min)
- **All Certification Domains**: Comprehensive review

---

## Assessment & Certification

### Course Project

Students will build a complete dbt project including:
- Staging layer with all sources configured
- Intermediate models for business logic
- Production marts (facts and dimensions)
- Comprehensive testing strategy (generic, singular, custom generic)
- Full documentation and exposures
- Incremental models and snapshots
- Contracts and governance features
- CI/CD workflow setup

### Certification Exam Preparation

By the end of this course, students will be prepared to:
- Understand all 8 certification exam domains
- Apply best practices in real-world scenarios
- Debug and troubleshoot dbt projects
- Design and implement production-ready pipelines
- Pass the dbt Analytics Engineering Certification exam

---

## Prerequisites

- SQL proficiency (SELECT, JOIN, WHERE, GROUP BY, CTEs)
- Basic Python knowledge (helpful but not required)
- Understanding of data warehousing concepts
- Git/GitHub familiarity
- Analytical thinking and problem-solving skills

## Tools & Technologies

- **dbt Core**: Hands-on development
- **dbt Cloud**: Conceptual understanding for deployment and certification topics
- **DuckDB**: Local analytical database
- **VS Code**: IDE with dbt Power User extension
- **Git/GitHub**: Version control and collaboration
- **Python**: For data generation and Python models

## Course Materials

All materials are provided in the course repository:
- 15 session slide decks (`class_material/`)
- Sample ecommerce dataset
- dbt project starter code
- Practice exercises and solutions
- Mock exam questions
- Certification study guide

## Success Metrics

Students who complete this course will be able to:
- ✅ Build production-ready dbt projects from scratch
- ✅ Implement all major dbt features (models, tests, docs, packages, macros)
- ✅ Apply governance and quality controls
- ✅ Debug complex dbt issues independently
- ✅ Deploy dbt projects to production
- ✅ Pass the dbt Analytics Engineering Certification exam with confidence
