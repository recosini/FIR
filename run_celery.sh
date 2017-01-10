#!/usr/bin/env sh

sleep 15

celery -A fir worker -l info
