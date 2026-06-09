#!/bin/bash

# Exit on error
set -e

echo "Building Flutter Web app with base href /My_Portfolio/..."
flutter build web --release --base-href "/My_Portfolio/"

echo "Deploying to GitHub Pages..."
cd build/web

# Initialize a temporary git repository
git init
git checkout -b gh-pages
git add .
git commit -m "Deploy to GitHub Pages"

# Push to the gh-pages branch of the repository
git remote add origin https://github.com/salluexez/My_Portfolio.git
git push -f origin gh-pages

echo "Successfully deployed! Your site will be live at: https://salluexez.github.io/My_Portfolio/ in a few minutes."
