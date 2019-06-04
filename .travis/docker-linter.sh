#!/usr/bin/env bash
set -eu

echo "Run docker linter: $1"
docker run --rm -i hadolint/hadolint:v1.3.0 hadolint --ignore DL3006 - < "$1"
echo "-end-"