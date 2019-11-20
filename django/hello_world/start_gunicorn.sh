#!/bin/bash

PID_FILE='logs/gunicorn.pid'
CPU_NUMBER=$(cat /proc/cpuinfo | grep processor | wc -l)

echo "${CPU_NUMBER}"

WORKERS=$((${CPU_NUMBER}*2+1))

echo "workers ${WORKERS}"

gunicorn hello_world.wsgi:application \
    --bind 0.0.0.0:8000 \
    --pid ${PID_FILE} \
    --worker-class gthread \
    --threads 3 \
    --workers ${WORKERS}
    # --access-logfile logs/gunicorn.log \
    # --error-logfile logs/gunicorn.log
