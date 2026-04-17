#!/bin/bash
#
# deploy.sh — push changes to all three targets:
#   1. HelpSeekerTechnologies GitHub (source of truth)
#   2. kimboharps GitHub (powers the kimboharps.github.io preview)
#   3. Azure Blob Storage (live production site)
#
# Usage:
#   ./deploy.sh              -> push to GitHub only (preview)
#   ./deploy.sh --azure      -> push to GitHub AND deploy to Azure (production)
#

set -e

cd "$(dirname "$0")"

echo "▶ Pushing to HelpSeekerTechnologies..."
git push origin main

echo ""
echo "▶ Pushing to kimboharps (preview site)..."
git push kimboharps main

echo ""
echo "✅ GitHub push complete."
echo "   Preview: https://kimboharps.github.io/Mareto-HQ-Artifacts/"

if [ "$1" = "--azure" ]; then
  echo ""
  echo "▶ Deploying to Azure Blob Storage (live site)..."
  az storage blob upload-batch \
    --account-name hsdeliverables \
    --destination '$web' \
    --source . \
    --destination-path "mareto-support" \
    --overwrite \
    --auth-mode login

  echo ""
  echo "✅ Azure deploy complete."
  echo "   Live: https://hsdeliverables.z9.web.core.windows.net/mareto-support/index.html"
else
  echo ""
  echo "ℹ  Skipped Azure deploy. Re-run with './deploy.sh --azure' to push to live site."
fi
