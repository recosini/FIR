# This file contains development specific settings
# Base settings should go to settings/base.py
# Production settings should go to settings/production.py
from fir.config.base import *

# DEBUG to True to have helpful error pages
DEBUG = True
TEMPLATES[0]['OPTIONS']['debug'] = True

# MySQL database backend
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': MYSQL_DATABASE,
        'USER': MYSQL_USER,
        'PASSWORD':MYSQL_PASSWORD,
        'HOST': MYSQL_HOST,
        'PORT': 3306,
    }
}

# Do not send real emails, print them to the console instead:
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

# List of callables that know how to import templates from various sources.
TEMPLATES[0]['OPTIONS']['loaders'] = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
)

# Dummy key for development
SECRET_KEY = 'DUMMY_KEY_FOR_DEVELOPMENT_DO_NOT_USE_IN_PRODUCTION'

# Default REDIS configuration when using fir_celery
REDIS_HOST = os.environ.get('REDIS_PORT_6379_TCP_ADDR', 'redis')
REDIS_PORT = 6379
REDIS_DB = 0

try:
    from fir.config.dev import *
except ImportError:
    pass
