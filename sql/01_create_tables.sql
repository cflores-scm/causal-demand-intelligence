-- =============================================================================
-- Module 1: Data Engineering — Create Tables in DuckDB
-- Project:  Causal Demand Intelligence System
-- Author:   Christian Flores Lozano
-- =============================================================================
-- Run via Python: see src/data/load.py
-- Database file: data/raw/favorita.duckdb
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. SALES (train) — 125M rows, core fact table
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS sales AS
SELECT *
FROM read_csv_auto(
    'data/raw/train.csv',
    header = true,
    types = {
        'id':          'INTEGER',
        'date':        'DATE',
        'store_nbr':   'TINYINT',
        'item_nbr':    'INTEGER',
        'unit_sales':  'DOUBLE',
        'onpromotion': 'BOOLEAN'
    }
);

-- -----------------------------------------------------------------------------
-- 2. STORES — 54 rows, store metadata
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS stores AS
SELECT *
FROM read_csv_auto(
    'data/raw/stores.csv',
    header = true,
    types = {
        'store_nbr': 'TINYINT',
        'city':      'VARCHAR',
        'state':     'VARCHAR',
        'type':      'VARCHAR',
        'cluster':   'TINYINT'
    }
);

-- -----------------------------------------------------------------------------
-- 3. ITEMS — 4,100 rows, item/product metadata
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS items AS
SELECT *
FROM read_csv_auto(
    'data/raw/items.csv',
    header = true,
    types = {
        'item_nbr':   'INTEGER',
        'family':     'VARCHAR',
        'class':      'SMALLINT',
        'perishable': 'TINYINT'
    }
);

-- -----------------------------------------------------------------------------
-- 4. TRANSACTIONS — 83,488 rows, daily transaction counts per store
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS transactions AS
SELECT *
FROM read_csv_auto(
    'data/raw/transactions.csv',
    header = true,
    types = {
        'date':         'DATE',
        'store_nbr':    'TINYINT',
        'transactions': 'INTEGER'
    }
);

-- -----------------------------------------------------------------------------
-- 5. HOLIDAYS_EVENTS — 350 rows, Ecuadorian holidays and events
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS holidays_events AS
SELECT *
FROM read_csv_auto(
    'data/raw/holidays_events.csv',
    header = true,
    types = {
        'date':        'DATE',
        'type':        'VARCHAR',
        'locale':      'VARCHAR',
        'locale_name': 'VARCHAR',
        'description': 'VARCHAR',
        'transferred': 'BOOLEAN'
    }
);

-- -----------------------------------------------------------------------------
-- 6. OIL — 1,218 rows, daily Brent crude oil price (macro proxy)
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS oil AS
SELECT *
FROM read_csv_auto(
    'data/raw/oil.csv',
    header = true,
    types = {
        'date':      'DATE',
        'dcoilwtico': 'DOUBLE'
    }
);

-- =============================================================================
-- Validation queries (run after loading)
-- =============================================================================
-- SELECT 'sales'           AS tbl, COUNT(*) AS n FROM sales
-- UNION ALL
-- SELECT 'stores',                  COUNT(*)      FROM stores
-- UNION ALL
-- SELECT 'items',                   COUNT(*)      FROM items
-- UNION ALL
-- SELECT 'transactions',            COUNT(*)      FROM transactions
-- UNION ALL
-- SELECT 'holidays_events',         COUNT(*)      FROM holidays_events
-- UNION ALL
-- SELECT 'oil',                     COUNT(*)      FROM oil;
