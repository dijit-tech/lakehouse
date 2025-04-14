#!/bin/bash

# Create a bucket in MinIO for NYC taxi data
mc alias set myminio http://minio:9000 ${MINIO_ACCESS_KEY} ${MINIO_SECRET_KEY}
mc mb myminio/nyc_taxi

# Load NYC taxi data into the MinIO bucket
# Assuming the NYC taxi data is in CSV format and located in the same directory
for file in ./data/*.csv; do
    mc cp "$file" myminio/nyc_taxi/
done

echo "NYC taxi data loaded into MinIO."