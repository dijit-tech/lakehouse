#!/bin/bash

# Initialize MinIO buckets
echo "Creating MinIO buckets..."
docker exec -it minio_container_name sh /config/minio/create-buckets.sh

# Load NYC taxi data into MinIO
echo "Loading NYC taxi data into MinIO..."
docker exec -it minio_container_name sh /data/nyc_taxi/load_data.sh

# Create Iceberg tables in Nessie
echo "Creating Iceberg tables in Nessie..."
docker exec -it trino_container_name trino --execute "$(cat /scripts/create_iceberg_tables.sql)"

# Create Superset dashboard
echo "Creating Superset dashboard..."
docker exec -it superset_container_name python /scripts/create_superset_dashboard.py

echo "Lakehouse stack initialization complete."