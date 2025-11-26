# Constitution - Bekaa SaaS Starter

## Princípios Fundamentais

### 1. Arquitetura Multi-Projetos no Google Cloud
- Cada componente principal deve ter seu próprio projeto GCP
- Separação de responsabilidades e isolamento de recursos
- Nomenclatura: `{project-name}-{component}-{environment}`

### 2. Design System: "Invisível quando funciona, Presente quando importa"
- Interface discreta e elegante quando tudo funciona
- Informação clara e ações evidentes quando necessário
- Simplicidade sofisticada com propósito em cada elemento

### 3. Multi-Tenancy
- Arquitetura multi-tenant com isolamento por organização
- Row-level security no banco de dados
- Contexto de tenant via subdomain ou header

### 4. Multi-Product Licensing
- Sistema de produtos modulares
- Assinaturas independentes por produto
- Controle de acesso granular

### 5. Segurança e Compliance
- Autenticação via Firebase Auth
- Autorização baseada em produtos e assinaturas
- Logs e auditoria completos
- Conformidade com LGPD e frameworks de compliance

### 6. Escalabilidade e Performance
- Microserviços independentes e escaláveis
- Cache estratégico onde necessário
- Otimização de queries e índices
- CDN para assets estáticos

### 7. Observabilidade
- Logs estruturados
- Métricas e alertas
- Tracing distribuído
- Dashboards executivos

### 8. CI/CD e Automação
- Deploy automatizado via GitHub Actions
- Testes automatizados em cada PR
- Deploy progressivo (dev → staging → prod)
- Rollback automático em caso de falha

### 9. Desenvolvimento Local
- Ambiente local completo via Docker/WSL
- Sincronização com GitHub via scripts
- Hot reload para desenvolvimento rápido

## Stack Tecnológica

- **Frontend**: Next.js 15, TypeScript, Tailwind CSS, Shadcn/ui (Bekaa theme)
- **Backend**: NestJS, TypeScript, Prisma ORM, PostgreSQL
- **Python Services**: FastAPI, Vertex AI SDK
- **Infraestrutura**: Google Cloud Platform (Cloud Run, Cloud SQL, Vertex AI)
- **Autenticação**: Firebase Auth
- **Pagamentos**: Stripe (opcional)
- **CI/CD**: GitHub Actions, Cloud Build
- **Monitoramento**: Cloud Logging, Cloud Monitoring, Error Reporting

## Convenções

- **Nomenclatura**: kebab-case para arquivos, PascalCase para componentes
- **Commits**: Conventional Commits
- **Branches**: `feature/`, `fix/`, `chore/`, `docs/`
- **Code Review**: Obrigatório antes de merge
- **Documentação**: Atualizada junto com o código

## Workflow Spec-Kit

1. **Constitution** - Princípios e diretrizes (este arquivo)
2. **Specs** - Especificações de alto nível
3. **Plans** - Planos de implementação detalhados
4. **Tasks** - Tarefas acionáveis

## Desenvolvimento Orientado por Especificações

- Sempre comece com especificações claras
- Documente decisões arquiteturais
- Mantenha planos atualizados
- Quebre tarefas grandes em pequenas

