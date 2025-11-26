# Especificação: Stack Tecnológica Completa

## Status
✅ **Aprovada e Obrigatória**

## Visão Geral

Esta especificação define a stack tecnológica completa e obrigatória para todos os projetos gerados a partir do Bekaa SaaS Starter. **Não é permitido desviar desta stack sem aprovação explícita.**

## Princípio Fundamental

> **"Consistência sobre Conveniência"** - Usar a stack definida garante:
> - Manutenibilidade
> - Reutilização de conhecimento
> - Compatibilidade entre projetos
> - Facilidade de onboarding

---

## 🎨 Frontend

### Framework: Next.js 15
- **Versão**: 15.x (App Router obrigatório)
- **Justificativa**: 
  - Server Components para performance
  - App Router para melhor organização
  - Suporte nativo a SSR/SSG
  - Ecossistema maduro
- **NÃO usar**: 
  - ❌ Next.js 14 ou anterior
  - ❌ Pages Router (apenas App Router)
  - ❌ Create React App
  - ❌ Vite standalone
  - ❌ Remix, SvelteKit, ou outros frameworks

### Linguagem: TypeScript
- **Versão**: 5.3+
- **Modo**: Strict mode obrigatório
- **Justificativa**: Type safety, melhor DX, menos bugs
- **NÃO usar**: 
  - ❌ JavaScript puro
  - ❌ TypeScript em modo não-strict

### Estilização: Tailwind CSS
- **Versão**: 3.4+
- **Config**: Bekaa Design System (packages/config/tailwind-config)
- **Justificativa**: Utility-first, consistência visual, performance
- **NÃO usar**: 
  - ❌ CSS Modules
  - ❌ Styled Components
  - ❌ Emotion
  - ❌ CSS-in-JS libraries
  - ❌ Bootstrap, Material-UI

### Componentes: Shadcn/ui (Bekaa Theme)
- **Base**: Shadcn/ui
- **Customização**: Bekaa Design System (packages/ui)
- **Justificativa**: Acessibilidade, customizável, base sólida
- **NÃO usar**: 
  - ❌ Material-UI
  - ❌ Ant Design
  - ❌ Chakra UI
  - ❌ Componentes customizados do zero (use packages/ui)

### Gerenciamento de Estado
- **Server State**: TanStack Query (React Query)
- **Client State**: React useState/useReducer
- **Global State**: Context API (apenas quando necessário)
- **NÃO usar**: 
  - ❌ Redux
  - ❌ Zustand
  - ❌ Jotai
  - ❌ Recoil

### Validação de Formulários
- **Biblioteca**: React Hook Form + Zod
- **Justificativa**: Performance, validação type-safe
- **NÃO usar**: 
  - ❌ Formik
  - ❌ Yup
  - ❌ Validação manual

---

## 🔧 Backend

### Framework: NestJS
- **Versão**: 10.x
- **Justificativa**: 
  - Arquitetura modular
  - TypeScript nativo
  - Decorators e DI
  - Ecossistema maduro
- **NÃO usar**: 
  - ❌ Express puro
  - ❌ Fastify
  - ❌ Koa
  - ❌ Hapi

### Linguagem: TypeScript
- **Versão**: 5.3+
- **Modo**: Strict mode obrigatório
- **NÃO usar**: 
  - ❌ JavaScript
  - ❌ TypeScript não-strict

### ORM: Prisma
- **Versão**: 5.9+
- **Justificativa**: 
  - Type-safe queries
  - Migrations automáticas
  - Excelente DX
  - Multi-tenant ready
- **NÃO usar**: 
  - ❌ TypeORM
  - ❌ Sequelize
  - ❌ Knex
  - ❌ Query builders manuais

### Banco de Dados: PostgreSQL
- **Versão**: 15+
- **Hosting**: Cloud SQL (produção) ou local (dev)
- **Justificativa**: 
  - Multi-tenant nativo
  - Row-level security
  - JSON support
  - Performance
- **NÃO usar**: 
  - ❌ MySQL
  - ❌ MongoDB
  - ❌ SQLite (exceto testes)
  - ❌ Supabase (usamos Prisma direto)

### Autenticação: Firebase Auth
- **Client**: Firebase SDK
- **Server**: Firebase Admin SDK
- **Justificativa**: 
  - Gerenciado pelo Google
  - Integração com GCP
  - Multi-tenant ready
- **NÃO usar**: 
  - ❌ Auth0
  - ❌ Supabase Auth
  - ❌ NextAuth
  - ❌ JWT manual
  - ❌ OAuth providers diretos

---

## 🐍 Python Services

### Framework: FastAPI
- **Versão**: 0.109+
- **Justificativa**: 
  - Performance
  - Type hints nativo
  - Documentação automática
  - Async support
- **NÃO usar**: 
  - ❌ Flask
  - ❌ Django
  - ❌ Tornado

### Python: 3.11+
- **Justificativa**: Performance, type hints melhorados
- **NÃO usar**: 
  - ❌ Python 3.10 ou anterior
  - ❌ Python 2.x

### Gerenciamento de Dependências: Poetry
- **Justificativa**: 
  - Lock file confiável
  - Dependency resolution
  - Virtual env management
- **NÃO usar**: 
  - ❌ pip + requirements.txt
  - ❌ pipenv
  - ❌ conda

### Validação: Pydantic
- **Versão**: 2.5+
- **Justificativa**: Type validation, integração com FastAPI
- **NÃO usar**: 
  - ❌ Validação manual
  - ❌ Marshmallow

### Vertex AI: Google Cloud SDK
- **Biblioteca**: `google-cloud-aiplatform`
- **Versão**: 1.40+
- **Justificativa**: Integração nativa com GCP
- **NÃO usar**: 
  - ❌ OpenAI SDK direto
  - ❌ LangChain (exceto se necessário)
  - ❌ Outros providers de IA

---

## ☁️ Infraestrutura

### Cloud Provider: Google Cloud Platform
- **Justificativa**: 
  - Integração com Firebase
  - Vertex AI nativo
  - Cloud SQL gerenciado
  - Cloud Run serverless
- **NÃO usar**: 
  - ❌ AWS
  - ❌ Azure
  - ❌ Vercel (exceto frontend opcional)

### Hosting Frontend: Cloud Run
- **Alternativa**: Vercel (permitido, mas não preferido)
- **Justificativa**: Consistência com backend, custos
- **NÃO usar**: 
  - ❌ Netlify
  - ❌ Railway
  - ❌ Heroku

### Hosting Backend: Cloud Run
- **Justificativa**: Serverless, auto-scaling, custos
- **NÃO usar**: 
  - ❌ App Engine
  - ❌ Compute Engine
  - ❌ Kubernetes (overkill para maioria dos casos)

### Database: Cloud SQL (PostgreSQL)
- **Justificativa**: Gerenciado, backups automáticos, alta disponibilidade
- **NÃO usar**: 
  - ❌ Supabase
  - ❌ PlanetScale
  - ❌ Self-hosted PostgreSQL

### Storage: Cloud Storage
- **Justificativa**: Integração nativa, CDN, custos
- **NÃO usar**: 
  - ❌ S3
  - ❌ Azure Blob
  - ❌ Local storage

---

## 🛠️ Ferramentas de Desenvolvimento

### Package Manager: pnpm
- **Versão**: 8.15+
- **Justificativa**: 
  - Performance
  - Disk space efficiency
  - Workspace support
- **NÃO usar**: 
  - ❌ npm
  - ❌ yarn

### Monorepo: Turborepo
- **Versão**: 2.0+
- **Justificativa**: 
  - Build caching
  - Task orchestration
  - Workspace management
- **NÃO usar**: 
  - ❌ Lerna
  - ❌ Nx
  - ❌ Workspaces pnpm puro

### CI/CD: GitHub Actions
- **Justificativa**: 
  - Integração nativa
  - Gratuito para open source
  - Marketplace de actions
- **NÃO usar**: 
  - ❌ GitLab CI
  - ❌ CircleCI
  - ❌ Jenkins

### Versionamento: Git
- **Workflow**: Git Flow ou GitHub Flow
- **Commits**: Conventional Commits
- **NÃO usar**: 
  - ❌ SVN
  - ❌ Mercurial

---

## 📦 Bibliotecas Específicas

### Pagamentos: Stripe (Opcional)
- **Versão**: Latest
- **Justificativa**: 
  - Padrão da indústria
  - Webhooks confiáveis
  - Documentação excelente
- **NÃO usar**: 
  - ❌ PayPal
  - ❌ Mercado Pago
  - ❌ PagSeguro

### Logging: Cloud Logging
- **Justificativa**: Integração nativa com GCP
- **NÃO usar**: 
  - ❌ Winston
  - ❌ Pino
  - ❌ Log4js

### Monitoramento: Cloud Monitoring
- **Justificativa**: Integração nativa
- **NÃO usar**: 
  - ❌ Datadog
  - ❌ New Relic
  - ❌ Sentry (exceto error tracking)

---

## 🚫 Anti-Patterns (NUNCA Fazer)

### ❌ Misturar Stacks
- Não usar Next.js com Express
- Não usar Prisma com TypeORM
- Não usar Firebase com Auth0

### ❌ Adicionar Dependências Sem Justificativa
- Sempre documentar por que uma nova lib é necessária
- Preferir soluções nativas quando possível
- Evitar "dependency hell"

### ❌ Ignorar Type Safety
- Sempre usar TypeScript strict
- Não usar `any` sem justificativa
- Validar dados em runtime (Zod/Pydantic)

### ❌ Quebrar Convenções
- Seguir estrutura de pastas definida
- Usar naming conventions
- Manter consistência entre projetos

---

## ✅ Checklist de Conformidade

Antes de adicionar qualquer tecnologia nova, verificar:

- [ ] Está na lista de tecnologias aprovadas?
- [ ] Tem justificativa clara e documentada?
- [ ] Foi aprovado em code review?
- [ ] Está documentado nesta spec?
- [ ] Não conflita com stack existente?

---

## 📝 Processo de Mudança

Se precisar adicionar/modificar a stack:

1. **Criar Issue** no GitHub explicando necessidade
2. **Atualizar esta spec** com justificativa
3. **Aprovação** de pelo menos 2 maintainers
4. **Atualizar templates** e documentação
5. **Comunicar** mudança para equipe

---

## 🔗 Referências

- [Next.js Docs](https://nextjs.org/docs)
- [NestJS Docs](https://docs.nestjs.com)
- [Prisma Docs](https://www.prisma.io/docs)
- [Firebase Docs](https://firebase.google.com/docs)
- [FastAPI Docs](https://fastapi.tiangolo.com)
- [Google Cloud Docs](https://cloud.google.com/docs)

---

**Última atualização**: 2025-01-XX  
**Versão**: 1.0.0  
**Status**: ✅ Obrigatória

