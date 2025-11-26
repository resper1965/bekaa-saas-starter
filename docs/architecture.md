# Architecture

Arquitetura do Bekaa SaaS Starter.

## Visão Geral

```
┌─────────────┐
│   Browser   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Next.js    │  (Frontend)
│  (Cloud Run)│
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   NestJS    │  (Backend API)
│  (Cloud Run)│
└──────┬──────┘
       │
       ├─────────┐
       ▼         ▼
┌──────────┐ ┌──────────┐
│ Cloud SQL│ │ Firebase │
│(Postgres)│ │   Auth   │
└──────────┘ └──────────┘
```

## Componentes

### Frontend (Next.js)

- **Framework**: Next.js 15 com App Router
- **UI**: Bekaa Design System (shadcn/ui base)
- **Auth**: Firebase Auth (client-side)
- **State**: React Query para server state
- **Deploy**: Cloud Run ou Vercel

### Backend (NestJS)

- **Framework**: NestJS
- **Database**: Prisma ORM + PostgreSQL
- **Auth**: Firebase Admin SDK
- **API**: REST + GraphQL (opcional)
- **Deploy**: Cloud Run

### Database

- **Type**: PostgreSQL (Cloud SQL)
- **ORM**: Prisma
- **Multi-tenant**: Row-level security
- **Migrations**: Prisma Migrate

### Autenticação

- **Client**: Firebase Auth
- **Server**: Firebase Admin SDK
- **Tokens**: JWT
- **Multi-tenant**: Context por organização

## Fluxo de Dados

1. Usuário faz login via Firebase Auth
2. Frontend recebe JWT token
3. Frontend faz requisições para API com token
4. API valida token via Firebase Admin
5. API consulta database com contexto de tenant
6. Resposta retorna para frontend

## Multi-Tenancy

### Isolamento

- **Database**: Row-level security por `organization_id`
- **API**: Filtro automático por organização
- **Frontend**: Context de organização via hook

### Contexto

```typescript
// Backend
@CurrentUser() user: User
@OrganizationId() orgId: string

// Frontend
const { organization } = useOrganization();
```

## Produtos

Cada produto é um módulo independente:

- **Backend**: `apps/api/src/modules/{product}/`
- **Frontend**: `apps/web/app/(dashboard)/{product}/`
- **Database**: Schema separado ou tabelas prefixadas

## Segurança

- **HTTPS**: Obrigatório em produção
- **CORS**: Configurado no backend
- **Rate Limiting**: Por organização
- **Input Validation**: Zod schemas
- **SQL Injection**: Prisma previne

## Escalabilidade

- **Horizontal**: Cloud Run auto-scaling
- **Database**: Read replicas
- **Cache**: Redis (opcional)
- **CDN**: Cloud CDN para assets

## Monitoramento

- **Logs**: Cloud Logging
- **Métricas**: Cloud Monitoring
- **Errors**: Error Reporting
- **Tracing**: Cloud Trace (opcional)

