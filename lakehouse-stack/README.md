# Lakehouse Stack

This project sets up a lakehouse architecture using MinIO for object storage, Nessie for the catalog, Trino for the compute layer, and Superset for visualization. The stack is designed to work on both Windows and Mac environments using Docker.

## Project Structure

```
lakehouse-stack
├── docker-compose.yml
├── .env
├── README.md
├── config
│   ├── minio
│   │   ├── config.env
│   │   └── create-buckets.sh
│   ├── nessie
│   │   └── application.properties
│   ├── trino
│   │   ├── catalog
│   │   │   ├── iceberg.properties
│   │   │   └── nessie.properties
│   │   ├── config.properties
│   │   └── jvm.config
│   └── superset
│       └── superset_config.py
├── data
│   └── nyc_taxi
│       └── load_data.sh
├── scripts
│   ├── initialize.sh
│   ├── create_iceberg_tables.sql
│   └── create_superset_dashboard.py
└── dashboards
    └── nyc_taxi_dashboard.json
```

## Getting Started

### Prerequisites

- Ensure Docker is installed and running on your machine.

### Running the Lakehouse Stack

1. Clone the repository or download the project files.
2. Navigate to the project directory in your terminal.
3. Create a `.env` file in the root directory with the necessary environment variables for MinIO and Nessie.
4. Run the following command to start all services defined in the `docker-compose.yml` file:

   ```bash
   docker-compose up
   ```

5. Access the services at the following URLs:
   - MinIO: `http://localhost:9000`
   - Nessie: `http://localhost:19120`
   - Trino: `http://localhost:8080`
   - Superset: `http://localhost:8088`

### Initializing the Lakehouse

Use the provided scripts to initialize the lakehouse:

- Run `scripts/initialize.sh` to create necessary tables in Nessie and load data into MinIO.
- The NYC taxi data can be loaded using the script located at `data/nyc_taxi/load_data.sh`.
- Create Iceberg tables in Nessie by executing the SQL script located at `scripts/create_iceberg_tables.sql`.
- Generate a sample dashboard in Superset using the Python script located at `scripts/create_superset_dashboard.py`.

### Sample Dashboard

A sample dashboard for the NYC taxi data is provided in the `dashboards/nyc_taxi_dashboard.json` file. You can import this JSON file into Superset to visualize the data.

## Conclusion

This lakehouse stack provides a robust framework for managing and analyzing large datasets using modern data architecture principles. Follow the steps above to set up and explore the capabilities of the stack.