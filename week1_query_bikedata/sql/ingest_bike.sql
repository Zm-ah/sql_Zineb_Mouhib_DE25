
CREATE TABLE IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.orders as (
        select * from read_cvs_auto('data/orders.cvs')
);

CREATE TABLE IF NOT EXISTS staging.costumers  as (
        select * from read_cvs_auto('data/costumers.cvs')
);
