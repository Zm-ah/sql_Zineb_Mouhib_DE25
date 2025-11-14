CREATE SCHEMA if not exists staging;

CREATE TABLE IF NOT EXISTS staging.joined_table as (
        select * from read_csv_auto('data/joined_table.csv')
);

