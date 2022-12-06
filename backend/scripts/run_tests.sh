#!/bin/bash
set -e

./scripts/check_migrations.sh
pytest "${@:-example_project}"
flake8 example_project
