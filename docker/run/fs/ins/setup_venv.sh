#!/bin/bash
set -e

# this has to be ready from base image
# if [ ! -d /opt/venv ]; then
#     # Create and activate Python virtual environment
#     python3.12 -m venv /opt/venv
#     source /opt/venv/bin/activate
# else
    # source /opt/venv/bin/activate
# fi

if [ -d /opt/venv-a0 ] && [ ! -d /opt/venv-ctx ]; then
    ln -s /opt/venv-a0 /opt/venv-ctx
fi

if [ -d /opt/venv-ctx ]; then
    source /opt/venv-ctx/bin/activate
fi