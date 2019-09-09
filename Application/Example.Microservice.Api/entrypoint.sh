#!/bin/bash
set -e

echo "Configuring Environment using Application ${CHAMBER_APPLICATION}"
exec ./chamber exec ${CHAMBER_APPLICATION} -- "$@"
