import duckdb

# Skapa en temporär databas i minnet
conn = duckdb.connect()

# Skapa en tabell och lägg in lite testdata
conn.execute("""
CREATE TABLE personer AS 
SELECT 'Anna' AS namn, 25 AS alder
UNION ALL
SELECT 'Erik', 32
UNION ALL
SELECT 'Sara', 28
""")

# Kör en SQL-fråga
result = conn.execute("SELECT * FROM personer WHERE alder > 26").fetchall()

# Skriv ut resultatet
print("Resultat från DuckDB:")
for rad in result:
    print(rad)

# Stäng anslutningen
conn.close()
