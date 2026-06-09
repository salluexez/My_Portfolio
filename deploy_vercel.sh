#!/bin/bash

# Exit on error
set -e

echo "Building Flutter Web app with base href /..."
flutter build web --release --base-href "/"

echo "Copying Vercel project configuration to build output..."
if [ -d ".vercel" ]; then
  mkdir -p build/web/.vercel
  cp -r .vercel/* build/web/.vercel/
fi

echo "Deploying build output directly to Vercel..."
cd build/web
npx vercel --prod
