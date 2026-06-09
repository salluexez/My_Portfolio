#!/bin/bash

# Exit on error
set -e

echo "Building Flutter Web app with base href /..."
flutter build web --release --base-href "/"

echo "Deploying to Vercel..."
npx vercel --prod
