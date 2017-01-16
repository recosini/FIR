#!/usr/bin/env sh

#cp fir/config/installed_apps.txt.sample fir/config/installed_apps.txt
sleep 15

./manage.py makemigrations

./manage.py migrate

./manage.py loaddata incidents/fixtures/seed_data.json && \
    ./manage.py loaddata incidents/fixtures/dev_users.json

#./manage.py runserver 0.0.0.0:8000

gunicorn --bind 0.0.0.0:8000 -w 2 fir.wsgi:application
