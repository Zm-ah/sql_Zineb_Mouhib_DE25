import pandas as pd
import duckdb

def query_database (querry: str, db_path: str = "data/lecture_13_15.duckdb") -> pd.DataFrame:
    
    """convenience function to opemn a duckdb database connection and query it """
    with duckdb.connect(db_path) as conn: 
        return conn.execute(querry=querry).df()