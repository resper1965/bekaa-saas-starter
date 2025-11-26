# 🚀 Bekaa SaaS Starter

> Template adaptado do nextjs/saas-starter para a arquitetura multi-SaaS da Plataforma Bekaa.

> **Get started quickly** com Next.js, Postgres (Cloud SQL), Stripe (opcional), Firebase Auth, e Design System Bekaa.

---

## 🎯 O Que Estamos Adaptando

### nextjs/saas-starter (Original)

```
✅ Next.js 15 + App Router
✅ Vercel-first deployment
✅ Supabase Auth + Database
✅ Stripe payments
✅ shadcn/ui components
✅ TypeScript
✅ Tailwind CSS
✅ Multi-tenancy básico
```

### bekaa-saas-starter (Adaptado)

```
Mantém:
✅ Next.js 15 + App Router
✅ Stripe payments (opcional)
✅ shadcn/ui base (customizado)
✅ TypeScript
✅ Tailwind CSS (com Bekaa theme)

Substitui:
🔄 Vercel → Cloud Run (mas Vercel ainda é opção)
🔄 Supabase Auth → Firebase Auth
🔄 Supabase Database → Prisma + Cloud SQL PostgreSQL
🔄 shadcn/ui default → Bekaa Design System
🔄 Single-tenant → Multi-tenant + Multi-product
🔄 Single app → Monorepo architecture

Adiciona:
➕ NestJS API backend
➕ Vertex AI RAG integration
➕ Python FastAPI services
➕ Multi-product licensing system
➕ WSL sync scripts
➕ Product scaffolding tools
➕ GitHub Spec-Kit (desenvolvimento orientado por especificações)
```

---

## 🚀 Quick Start

### 1. Clone e Instale

```bash
git clone https://github.com/bekaa/bekaa-saas-starter.git meu-produto
cd meu-produto
pnpm install
```

### 2. Configure Environment

```bash
cp .env.example .env
# Editar .env com suas credenciais
```

### 3. Setup Database

```bash
pnpm db:migrate
pnpm db:seed
```

### 4. Inicie Desenvolvimento

```bash
pnpm dev
```

Frontend: http://localhost:3000  
Backend API: http://localhost:8080

### 5. Crie Seu Primeiro Produto

```bash
pnpm generate:product
```

Siga os prompts para scaffoldar um produto completo.

---

## 📁 Estrutura

```
bekaa-saas-starter/
├── apps/
│   ├── web/              # Next.js 15 Frontend
│   ├── api/              # NestJS Backend
│   └── scripts/          # Python Services
├── packages/
│   ├── ui/               # Bekaa Design System
│   ├── auth/             # Firebase Auth
│   ├── database/         # Prisma
│   ├── types/            # TypeScript types
│   └── config/           # Shared configs
├── tools/
│   ├── generators/       # Product/Module generators
│   └── sync/             # WSL sync scripts
└── docs/                 # Documentação
```

---

## 🎨 Design System

Bekaa Design System baseado em shadcn/ui com:

- **Cores**: Primary (#00ade8), Slate grays
- **Tipografia**: Montserrat (display), Inter (body)
- **Componentes**: Button, Card, Badge, Brand, etc.
- **Filosofia**: "Invisível quando funciona, Presente quando importa"

---

## 🔐 Autenticação

Firebase Auth integrado com:

- Login/Signup/Reset Password
- Multi-tenant support
- Product access control
- Session management

---

## 💳 Pagamentos (Opcional)

Stripe integrado para:

- Subscription management
- Checkout sessions
- Webhooks
- Billing portal

---

## 🛠️ Product Generator

Scaffold produtos completos em segundos:

```bash
pnpm generate:product
```

Cria automaticamente:
- Database schema
- Backend module (NestJS)
- Frontend routes (Next.js)
- Product catalog entry
- Navigation items

---

## 📚 Documentação

- [Getting Started](./docs/getting-started.md)
- [Creating Products](./docs/creating-products.md)
- [Design System](./docs/design-system.md)
- [Deployment](./docs/deployment.md)
- [Architecture](./docs/architecture.md)
- [Spec-Kit](./.spec-kit/README.md) - Desenvolvimento orientado por especificações

---

## 🚀 Deploy

### Google Cloud Run

```bash
pnpm deploy:production
```

### Vercel (também suportado)

```bash
vercel deploy
```

---

## 📝 Scripts Disponíveis

```bash
# Desenvolvimento
pnpm dev                    # Inicia todos os serviços
pnpm build                  # Build de produção
pnpm test                   # Executa testes
pnpm lint                   # Lint do código

# Database
pnpm db:migrate             # Executa migrations
pnpm db:push                # Push schema sem migrations
pnpm db:studio              # Abre Prisma Studio
pnpm db:seed                # Popula dados iniciais

# Generators
pnpm generate:product       # Cria novo produto
pnpm generate:module        # Cria novo módulo

# Sync (WSL)
pnpm sync:push              # Push para GitHub
pnpm sync:pull              # Pull do GitHub
pnpm backup                 # Backup diário
```

---

## 🎯 Próximos Passos

1. **Configure Firebase**: Crie projeto e adicione credenciais
2. **Setup Database**: Configure Cloud SQL ou PostgreSQL local
3. **Crie Primeiro Produto**: Use `pnpm generate:product`
4. **Customize Design**: Ajuste cores e componentes em `packages/ui`
5. **Deploy**: Configure CI/CD e faça deploy

---

## 🤝 Contribuindo

Este é um template open-source. Contribuições são bem-vindas!

---

## 📄 Licença

MIT License - veja LICENSE para detalhes.

---

## 🔗 Links

- [Documentação Completa](./docs/)
- [Design System](./docs/design-system.md)
- [Exemplo: bekaa-platform](../bekaa-platform/)

