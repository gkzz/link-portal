#!/bin/bash

set -e

APP_NAME=$1

mkdir -p portal/$APP_NAME \
  && python manage.py startapp $APP_NAME portal/$APP_NAME
