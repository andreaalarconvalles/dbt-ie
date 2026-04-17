---
marp: true
author:
  - name: Daniel Garcia
  - email: dgarciah@faculty.ie.edu
  - url: www.linkedin.com/in/dgarhdez
header: ![center width:100px](../img/ie_logo.png)
size: 16:9
footer: "Analytics Engineering, dgarciah@faculty.ie.edu"
theme: default
math: katex
style: |
    img[alt~="center"] {
      display: block;
      margin: 0 auto;
    }
---

<!-- _color: "rgba(21, 51, 96, 1)" -->

# Analytics Engineering: Session 2

## Setting Up dbt & Building First Models

---

## Agenda

- Introduction to DuckDB
- Setting up the Database
- Git Workflow: Forking & Cloning
- The VS Code IDE & dbt Power User
- Building Your First Model
- The `ref()` Macro & Modularity
- Key dbt Commands

---

## Introduction to DuckDB

**Why DuckDB?**

- **"SQLite for Analytics"**: An in-process SQL OLAP database management system.
- **Serverless**: No need to install or manage a database server.
- **Fast**: Optimized for analytical queries (columnar storage).
- **Integration**: Works seamlessly with Python, dbt, and Parquet files.

In this course, DuckDB acts as our Data Warehouse, running locally on your machine.

---

## Setting up the Database

We need to generate our dataset and load it into DuckDB.

1.  **Create Virtual Environment**:
    ```bash
    uv venv dbt_mbads && source dbt_mbads/bin/activate
    uv pip install -r requirements.txt
    ```

2.  **Create Database**: Run the script to load Parquet data into DuckDB.
    ```bash
    python create_db.py
    ```
    *This creates `my_database.duckdb` with tables like `customers`, `orders`, etc.*

3.  **Install dbt packages**:
    ```bash
    dbt deps
    ```

---

## Git Workflow: Forking & Cloning

We will use a standard Pull Request workflow.

1.  **Fork**: Create your own copy of the course repository on GitHub.
2.  **Clone**: Download your fork to your local machine.
    ```bash
    git clone https://github.com/YOUR_USERNAME/dbt-ie.git
    ```
3.  **Branch**: Create a new branch for your work.
    ```bash
    git checkout -b feature/my-changes
    ```
4.  **Commit & Push**: Save your changes and send them to GitHub.

---

## The VS Code IDE

We use Visual Studio Code as our Integrated Development Environment.

**Key Extensions**:
- **Python**: For running scripts and managing environments.
- **dbt Power User**: For dbt-specific features.
- **SQLTools**: For querying the database directly.
- **Rainbow CSV**: For viewing CSV files.

---

## VSCode dbt Power User Extension

We will use this extension to bridge the gap between code and execution.

**Installation**:
1. Go to the Extensions view in VS Code (Cmd+Shift+X).
2. Search for "dbt Power User" (by Innoverio).
3. Install it.

**Features**:
- **Go to Definition**: Cmd+Click on a `ref()` to jump to the model.
- **Query Preview**: Run the current model's SQL against the DB.
- **Lineage**: Visualize dependencies.

---

## Building Your First Model

A dbt model is a SQL `SELECT` statement saved as a `.sql` file in the `models/` directory.

```sql
-- models/staging/stg_customers.sql
select
    customer_id,
    first_name,
    last_name,
    email
from {{ source('raw', 'customers') }}
```

Run it with:
```bash
dbt run -s stg_customers
```

---

## The `ref()` Macro & Modularity

`ref()` is how models reference each other — it creates **dependencies**.

```sql
-- models/intermediate/int_customers.sql
select *
from {{ ref('stg_customers') }}
left join {{ ref('segments') }}
    on stg_customers.segment_id = segments.segment_id
```

- dbt uses `ref()` to build the **DAG** (Directed Acyclic Graph).
- It resolves to the correct schema and table name at compile time.
- It determines the correct **execution order**.

---

## Key dbt Commands

| Command | Purpose |
| :--- | :--- |
| `dbt run` | Build all models |
| `dbt run -s model_name` | Build a single model |
| `dbt compile` | Compile SQL without running it |
| `dbt build` | Run + test + seed + snapshot (in DAG order) |
| `dbt debug` | Verify connection and configuration |
| `dbt deps` | Install packages from `packages.yml` |

---

## Exploring Compiled SQL

After running `dbt compile` or `dbt run`:

1. Open `target/compiled/dbt_ie/models/staging/stg_customers.sql`
2. See how `{{ source('raw', 'customers') }}` becomes `"main"."customers"`
3. See how `{{ ref('stg_customers') }}` becomes the full table reference

*This is critical for debugging — always check compiled SQL!*

---

## Naming Conventions

Consistent naming helps teams collaborate effectively.

| Layer | Prefix | Example |
| :--- | :--- | :--- |
| Staging | `stg_` | `stg_customers`, `stg_orders` |
| Intermediate | `int_` | `int_order_items_summary` |
| Dimensions | `dim_` | `dim_customers`, `dim_products` |
| Marts/Facts | `mart_` | `mart_orders`, `mart_revenue_by_segment` |

---

## What have we learned in this session

- Fork the course repository and clone to local machine
- Install dependencies and configure the dbt profile
- Generate data and create the DuckDB database
- Build and run your first dbt model
- Use `ref()` to create model dependencies
- Explore compiled SQL in `target/`
- Key dbt commands: `run`, `compile`, `build`, `debug`

**Next Session:** Sources, Seeds, Dependencies & First Tests.
