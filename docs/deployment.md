# Deployment Guide

Guia de deploy do Bekaa SaaS Starter para Google Cloud Platform.

## Pré-requisitos

- Google Cloud account
- gcloud CLI instalado
- Projetos GCP criados
- Billing habilitado

## Estrutura de Projetos GCP

```
{project-name}-shared-{env}    # Recursos compartilhados
{project-name}-web-{env}       # Frontend
{project-name}-api-{env}       # Backend
```

## Deploy do Frontend (Cloud Run)

### 1. Build

```bash
cd apps/web
pnpm build
```

### 2. Deploy

```bash
gcloud run deploy bekaa-web \
  --source . \
  --region us-central1 \
  --project bekaa-web-prod \
  --allow-unauthenticated
```

### 3. Configurar Domínio

```bash
gcloud run domain-mappings create \
  --service bekaa-web \
  --domain app.bekaa.io \
  --region us-central1
```

## Deploy do Backend (Cloud Run)

### 1. Build

```bash
cd apps/api
pnpm build
```

### 2. Deploy

```bash
gcloud run deploy bekaa-api \
  --source . \
  --region us-central1 \
  --project bekaa-api-prod \
  --set-env-vars DATABASE_URL=... \
  --set-secrets FIREBASE_ADMIN_KEY=...
```

## Database (Cloud SQL)

### 1. Criar Instância

```bash
gcloud sql instances create bekaa-db \
  --database-version=POSTGRES_15 \
  --tier=db-f1-micro \
  --region=us-central1
```

### 2. Criar Database

```bash
gcloud sql databases create bekaa_prod \
  --instance=bekaa-db
```

### 3. Executar Migrations

```bash
DATABASE_URL="postgresql://..." pnpm db:migrate
```

## CI/CD com GitHub Actions

Ver `.github/workflows/deploy.yml` para pipeline completo.

## Variáveis de Ambiente

Configure via Secret Manager:

```bash
gcloud secrets create DATABASE_URL --data-file=-
gcloud secrets create FIREBASE_ADMIN_KEY --data-file=-
```

## Monitoramento

- Cloud Logging: Logs automáticos
- Cloud Monitoring: Métricas e alertas
- Error Reporting: Erros em produção

## Rollback

```bash
gcloud run services update-traffic bekaa-web \
  --to-revisions REVISION_NAME=100
```

