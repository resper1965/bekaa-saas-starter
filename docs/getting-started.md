# Getting Started with Bekaa SaaS Starter

## Prerequisites

- Node.js 20+
- pnpm 8+
- PostgreSQL 15+ (ou Cloud SQL)
- Google Cloud account (para produção)
- Firebase project
- Stripe account (opcional)

## Quick Start

### 1. Clone and Install

```bash
git clone https://github.com/bekaa/bekaa-saas-starter.git
cd bekaa-saas-starter
pnpm install
```

### 2. Setup Environment

```bash
cp .env.example .env
# Editar .env com suas credenciais
```

### 3. Setup Database

```bash
# Run migrations
pnpm db:migrate

# Seed initial data (se disponível)
pnpm db:seed
```

### 4. Start Development

```bash
# Start all services (frontend + backend)
pnpm dev
```

Frontend: http://localhost:3000  
Backend API: http://localhost:8080  
Prisma Studio: `pnpm db:studio`

## Creating Your First Product

```bash
pnpm generate:product
```

Ou use diretamente:

```bash
tsx tools/generators/generate-product.ts "Privacy Manager" privacy "Gestão de privacidade" 99 Shield primary
```

Isso cria automaticamente:
- Database schema (migration)
- Backend module (NestJS)
- Frontend routes (Next.js)
- Product catalog entry

## Next Steps

- [Creating Products](./creating-products.md)
- [Design System](./design-system.md)
- [Deployment](./deployment.md)
- [Architecture](./architecture.md)

## Troubleshooting

### Erro de dependências

```bash
# Limpar e reinstalar
pnpm clean
pnpm install
```

### Erro de Prisma

```bash
# Regenerar Prisma Client
cd packages/database
pnpm prisma generate
```

### Erro de Firebase

Verifique se todas as variáveis `NEXT_PUBLIC_FIREBASE_*` estão configuradas no `.env`.

