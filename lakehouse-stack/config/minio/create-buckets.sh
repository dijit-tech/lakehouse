#!/bin/bash

# Create buckets in MinIO
MINIO_HOST="minio:9000"
ACCESS_KEY="minioadmin"
SECRET_KEY="minioadmin"

# Create a bucket for NYC taxi data
BUCKET_NAME="nyc_taxi"

# Check if the bucket already exists
if ! mc ls ${MINIO_HOST}/${BUCKET_NAME} > /dev/null 2>&1; then
    mc mb ${MINIO_HOST}/${BUCKET_NAME}
    echo "Bucket '${BUCKET_NAME}' created."
else
    echo "Bucket '${BUCKET_NAME}' already exists."
fi

# Add more buckets as needed
# Example: Create a bucket for another dataset
# ANOTHER_BUCKET_NAME="another_dataset"
# if ! mc ls ${MINIO_HOST}/${ANOTHER_BUCKET_NAME} > /dev/null 2>&1; then
#     mc mb ${MINIO_HOST}/${ANOTHER_BUCKET_NAME}
#     echo "Bucket '${ANOTHER_BUCKET_NAME}' created."
# else
#     echo "Bucket '${ANOTHER_BUCKET_NAME}' already exists."
# fi