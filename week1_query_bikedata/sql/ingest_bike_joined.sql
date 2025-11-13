CREATE TABLE IF NOT EXISTS staging.joined as (
        select * from read_cvs_auto('data/joined.cvs')
);