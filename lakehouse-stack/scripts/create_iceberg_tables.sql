CREATE TABLE nyc_taxi (
    vendor_id STRING,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,
    passenger_count INT,
    trip_distance DOUBLE,
    pickup_location_id INT,
    dropoff_location_id INT,
    payment_type STRING,
    fare_amount DOUBLE,
    extra DOUBLE,
    mta_tax DOUBLE,
    tip_amount DOUBLE,
    tolls_amount DOUBLE,
    total_amount DOUBLE
) 
USING iceberg
PARTITIONED BY (date(pickup_datetime))
LOCATION 's3a://nyc-taxi-bucket/nyc_taxi';