# Creating Products

Guia completo para criar novos produtos no Bekaa SaaS Starter.

## Usando o Product Generator

### Método 1: CLI Interativo

```bash
pnpm generate:product
```

Siga os prompts:
- Product name: "Privacy Manager"
- Slug: "privacy"
- Description: "Gestão completa de privacidade e LGPD"
- Base price: 99
- Icon: "Shield"
- Color: "primary"

### Método 2: Linha de Comando

```bash
tsx tools/generators/generate-product.ts \
  "Privacy Manager" \
  privacy \
  "Gestão completa de privacidade e LGPD" \
  99 \
  Shield \
  primary
```

## O Que É Criado

### 1. Database Schema

O generator prepara o schema no Prisma. Execute:

```bash
pnpm db:migrate
```

Isso criará:
- Tabelas necessárias
- Índices
- Relacionamentos

### 2. Backend Module

Criado em `apps/api/src/modules/{slug}/`:

- `{slug}.module.ts` - Módulo NestJS
- `{slug}.controller.ts` - Controller REST
- `{slug}.service.ts` - Lógica de negócio

### 3. Frontend Routes

Criado em `apps/web/app/(dashboard)/{slug}/`:

- `layout.tsx` - Layout com verificação de acesso
- `page.tsx` - Página principal do produto

### 4. Product Catalog

Adicionado em `apps/web/config/products.ts`:

- Configuração do produto
- Features
- Preço
- Ícone

## Customização

### Backend

Edite `apps/api/src/modules/{slug}/` para adicionar:
- Endpoints adicionais
- Validações
- Integrações
- Business logic

### Frontend

Edite `apps/web/app/(dashboard)/{slug}/` para adicionar:
- Componentes específicos
- Formulários
- Dashboards
- Relatórios

### Database

Adicione campos no Prisma schema:

```prisma
model PrivacyMainData {
  // ... campos existentes
  newField String?
}
```

Execute migration:

```bash
pnpm db:migrate
```

## Exemplo Completo

```bash
# 1. Gerar produto
pnpm generate:product

# 2. Executar migrations
pnpm db:migrate

# 3. Adicionar ao app.module.ts (backend)
# Importar e adicionar PrivacyModule aos imports

# 4. Customizar frontend
# Editar apps/web/app/(dashboard)/privacy/page.tsx

# 5. Testar
pnpm dev
```

## Boas Práticas

1. **Nomenclatura**: Use kebab-case para slugs
2. **Isolamento**: Cada produto deve ser independente
3. **Reutilização**: Use componentes do `@bekaa/ui`
4. **Type Safety**: Use types do `@bekaa/types`
5. **Documentação**: Documente APIs e componentes

