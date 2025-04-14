from superset.config import *

# This file contains configuration settings for Superset

# Database connection settings
SQLALCHEMY_DATABASE_URI = 'postgresql+psycopg2://user:password@db:5432/superset'

# Enable authentication
AUTH_TYPE = AUTH_DB
AUTH_USER_REGISTRATION = True
AUTH_USER_REGISTRATION_ROLE = "Gamma"

# Set the default role for new users
DEFAULT_ROLE = "Gamma"

# Enable caching
CACHE_CONFIG = {
    'CACHE_TYPE': 'RedisCache',
    'CACHE_DEFAULT_TIMEOUT': 300,
    'CACHE_KEY_PREFIX': 'superset_',
    'CACHE_REDIS_URL': 'redis://redis:6379/0'
}

# Configure the feature flags
FEATURE_FLAGS = {
    'ALERTS': True,
    'DASHBOARD_CROSS_FILTERS': True,
}

# Set the secret key for session management
SECRET_KEY = 'your_secret_key_here'

# Configure the logging
LOGGING_LEVEL = 'INFO'
LOGGING_FORMAT = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'

# Set the default timezone
SUPERSET_TIMEZONE = 'UTC'