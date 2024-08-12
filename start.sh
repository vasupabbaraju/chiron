#!/bin/bash

export NODE_OPTIONS=--max_old_space_size=8192

echo ""
echo "Restoring frontend npm packages"
echo ""
cd src/frontend
npm install
if [ $? -ne 0 ]; then
    echo "Failed to restore frontend npm packages"
    exit $?
fi

echo ""
echo "Building frontend"
echo ""
npm run build
if [ $? -ne 0 ]; then
    echo "Failed to build frontend"
    exit $?
fi

cd ../..
. ./scripts/loadenv.sh

echo ""
echo "Starting backend"
echo ""
cd src/backend
../../.venv/bin/python -m quart run --port=50505 --host=127.0.0.1 --reload
if [ $? -ne 0 ]; then
    echo "Failed to start backend"
    exit $?
fi

cd ../..