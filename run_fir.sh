#!/usr/bin/env bash

# Uncomment the line below to set or reset installed apps each time
# cp fir/config/installed_apps.txt.sample fir/config/installed_apps.txt

# Wait for the db service to be fully operationnal
sleep 20

# Init Django project
./manage.py collectstatic --noinput
./manage.py makemigrations
./manage.py migrate --noinput

# Import initial data and test users
./manage.py loaddata incidents/fixtures/seed_data.json && \
    ./manage.py loaddata incidents/fixtures/dev_users.json

gunicorn --bind :8000 -w 2 fir.wsgi:application
