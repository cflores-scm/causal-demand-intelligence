"""
src/data/load.py
================
Load all Corporación Favorita CSV files into DuckDB.

Usage (from project root):
    python src/data/load.py

Creates:  data/raw/favorita.duckdb
"""

import duckdb
import time
from pathlib import Path

DB_PATH = Path("data/raw/favorita.duckdb")

# CSV file → table name mapping
CSV_TABLES = [
    ("sales",           "data/raw/train.csv"),
    ("stores",          "data/raw/stores.csv"),
    ("items",           "data/raw/items.csv"),
    ("transactions",    "data/raw/transactions.csv"),
    ("holidays_events", "data/raw/holidays_events.csv"),
    ("oil",             "data/raw/oil.csv"),
]


def load_all(db_path: Path = DB_PATH) -> duckdb.DuckDBPyConnection:
    """Load all CSV files into DuckDB and return an open connection."""
    db_path.parent.mkdir(parents=True, exist_ok=True)

    # Remove existing DB to allow a clean reload
    if db_path.exists():
        db_path.unlink()

    con = duckdb.connect(str(db_path))

    for table_name, csv_path in CSV_TABLES:
        if not Path(csv_path).exists():
            print(f"  [SKIP] {csv_path} not found")
            continue

        print(f"  Loading {table_name:<20}", end=" ", flush=True)
        t0 = time.time()

        con.execute(f"""
            CREATE TABLE {table_name} AS
            SELECT * FROM read_csv_auto('{csv_path}', header=true)
        """)

        elapsed = time.time() - t0
        n = con.execute(f"SELECT COUNT(*) FROM {table_name}").fetchone()[0]
        print(f"→ {n:>15,} rows  ({elapsed:.1f}s)")

    return con


def validate(con: duckdb.DuckDBPyConnection) -> None:
    """Print row counts, column info, and date ranges for all tables."""
    print("\n=== Schema Validation ===\n")
    print(f"  {'Table':<22} {'Rows':>15} {'Cols':>6}")
    print("  " + "-" * 46)

    for (tbl,) in con.execute("SHOW TABLES").fetchall():
        n     = con.execute(f"SELECT COUNT(*) FROM {tbl}").fetchone()[0]
        ncols = len(con.execute(f"DESCRIBE {tbl}").fetchall())
        print(f"  {tbl:<22} {n:>15,} {ncols:>6}")

    print("\n=== Column Types ===\n")
    for (tbl,) in con.execute("SHOW TABLES").fetchall():
        cols = con.execute(f"DESCRIBE {tbl}").fetchall()
        col_str = ", ".join(f"{c[0]} ({c[1]})" for c in cols)
        print(f"  {tbl}: {col_str}\n")

    print("=== Date Ranges ===\n")
    for tbl in ["sales", "transactions", "oil", "holidays_events"]:
        try:
            row = con.execute(f"SELECT MIN(date), MAX(date) FROM {tbl}").fetchone()
            print(f"  {tbl:<22} {str(row[0])} → {str(row[1])}")
        except Exception:
            pass


if __name__ == "__main__":
    print(f"\nLoading data into DuckDB: {DB_PATH}\n")
    t_start = time.time()
    con = load_all()
    validate(con)
    con.close()
    total = time.time() - t_start
    size  = DB_PATH.stat().st_size / 1e9
    print(f"\nTotal time: {total / 60:.1f} min")
    print(f"Database:   {DB_PATH}  ({size:.2f} GB)\n")
