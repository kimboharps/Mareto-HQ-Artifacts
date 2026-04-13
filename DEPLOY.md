# Deploying to Azure Blob Storage

The Help Centre is hosted on Azure static website at:
**https://hsdeliverables.z9.web.core.windows.net/mareto-support/index.html**

## Prerequisites
- Azure CLI installed (`az` command)
- Logged in with `az login` (account with Storage Blob Data Contributor on `hsdeliverables`)

## Deploy all files (index + guides + FAQs + videos)

```bash
az storage blob upload-batch \
  --account-name hsdeliverables \
  --destination '$web' \
  --source . \
  --destination-path "mareto-support" \
  --overwrite \
  --auth-mode login
```

## Deploy only the index page

```bash
az storage blob upload \
  --account-name hsdeliverables \
  --container-name '$web' \
  --name "mareto-support/index.html" \
  --file index.html \
  --content-type "text/html" \
  --overwrite \
  --auth-mode login
```

## Notes
- The static website index document is NOT set to `index.html`, so use the full path `/mareto-support/index.html` in the iframe embed
- The Corteza iframe page is at `main.mareto.helpseeker.org` (namespace: AWHCanada, page ID: 490939683933519873)
- Guide/FAQ/video sub-pages are self-contained HTML in `guides/`, `faqs/`, `videos/` and open in new tabs from the Artifact Library
