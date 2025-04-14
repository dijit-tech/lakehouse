import requests
import json

# Superset configuration
superset_url = "http://localhost:8088/api/v1/dashboard/"
superset_username = "admin"
superset_password = "admin"

# Authenticate with Superset
session = requests.Session()
session.post("http://localhost:8088/api/v1/security/login", json={
    "username": superset_username,
    "password": superset_password
})

# Define the dashboard metadata
dashboard_data = {
    "dashboard_title": "NYC Taxi Dashboard",
    "position_json": json.dumps({
        "CHART-1": {
            "type": "chart",
            "id": "CHART-1",
            "meta": {
                "chartId": "nyc_taxi_chart",
                "sliceId": 1
            },
            "x": 0,
            "y": 0,
            "w": 24,
            "h": 12
        }
    }),
    "slices": [
        {
            "slice_name": "NYC Taxi Data",
            "viz_type": "table",
            "datasource_id": 1,  # Update with the actual datasource ID
            "datasource_type": "table",
            "params": {
                "metrics": ["count"],
                "groupby": ["pickup_location_id"],
                "time_range": "Last week",
                "order_desc": True
            }
        }
    ]
}

# Create the dashboard
response = session.post(superset_url, json=dashboard_data)

if response.status_code == 201:
    print("Dashboard created successfully!")
else:
    print("Failed to create dashboard:", response.json())