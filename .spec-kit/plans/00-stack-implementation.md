# Plano de Implementação: Stack Tecnológica Base

## Objetivo

Garantir que todos os projetos gerados a partir do Bekaa SaaS Starter usem exatamente a mesma stack tecnológica, sem desvios.

## Contexto

Este plano implementa a especificação `specs/01-stack-tecnologica.md` no template base, garantindo que:
- Todas as dependências corretas estejam configuradas
- Templates e generators usem a stack correta
- Documentação reflita as escolhas tecnológicas
- Validações impeçam uso de tecnologias não aprovadas

## Fases

### Fase 1: Configuração de Dependências ✅

**Status**: Completo

**Tarefas**:
- [x] package.json root com versões fixas
- [x] pnpm-workspace.yaml configurado
- [x] turbo.json configurado
- [x] TypeScript strict mode habilitado

**Arquivos**:
- `package.json`
- `pnpm-workspace.yaml`
- `turbo.json`
- `tsconfig.json`

### Fase 2: Packages Base ✅

**Status**: Completo

**Tarefas**:
- [x] @bekaa/ui com Tailwind + Shadcn base
- [x] @bekaa/auth com Firebase
- [x] @bekaa/database com Prisma
- [x] @bekaa/types com TypeScript types
- [x] @bekaa/config com Tailwind config

**Arquivos**:
- `packages/ui/package.json`
- `packages/auth/package.json`
- `packages/database/package.json`
- `packages/types/package.json`
- `packages/config/`

### Fase 3: Templates e Generators

**Status**: Em progresso

**Tarefas**:
- [ ] Product generator usa stack correta
- [ ] Module generator usa NestJS
- [ ] Component generator usa Shadcn/ui
- [ ] Validações no generator

**Arquivos**:
- `tools/generators/generate-product.ts`
- `tools/generators/generate-module.ts` (criar)
- `tools/generators/generate-component.ts` (criar)

### Fase 4: Documentação

**Status**: Em progresso

**Tarefas**:
- [x] Spec da stack tecnológica
- [x] Este plano de implementação
- [ ] Guia de "Por que esta stack?"
- [ ] Guia de troubleshooting
- [ ] Checklist de conformidade

**Arquivos**:
- `.spec-kit/specs/01-stack-tecnologica.md` ✅
- `.spec-kit/plans/00-stack-implementation.md` ✅
- `docs/why-this-stack.md` (criar)
- `docs/troubleshooting.md` (criar)

### Fase 5: Validações e Linting

**Status**: Pendente

**Tarefas**:
- [ ] ESLint rules para prevenir imports não aprovados
- [ ] Pre-commit hooks
- [ ] CI checks de conformidade
- [ ] Script de validação de stack

**Arquivos**:
- `.eslintrc.json` (atualizar)
- `.husky/pre-commit` (criar)
- `.github/workflows/stack-check.yml` (criar)
- `tools/validate-stack.sh` (criar)

### Fase 6: Exemplos e Templates

**Status**: Pendente

**Tarefas**:
- [ ] App web exemplo (Next.js 15)
- [ ] App API exemplo (NestJS)
- [ ] Python service exemplo (FastAPI)
- [ ] Componentes UI exemplo

**Arquivos**:
- `apps/web/` (criar estrutura)
- `apps/api/` (criar estrutura)
- `apps/scripts/rag-service/` (criar estrutura)

## Scripts de Validação

### validate-stack.sh

```bash
#!/bin/bash
# Valida se projeto está usando stack aprovada

echo "🔍 Validando stack tecnológica..."

# Verificar package.json
if grep -q "react-scripts" package.json; then
  echo "❌ Create React App detectado (não permitido)"
  exit 1
fi

if grep -q "express" package.json && ! grep -q "nest" package.json; then
  echo "❌ Express sem NestJS (não permitido)"
  exit 1
fi

# Verificar TypeScript strict
if ! grep -q '"strict": true' tsconfig.json; then
  echo "❌ TypeScript strict mode não habilitado"
  exit 1
fi

echo "✅ Stack validada com sucesso"
```

## Checklist de Conformidade

Antes de fazer commit, verificar:

- [ ] Todas as dependências estão na lista aprovada?
- [ ] TypeScript strict mode habilitado?
- [ ] Usando pnpm (não npm/yarn)?
- [ ] Estrutura de pastas correta?
- [ ] Naming conventions seguidas?

## Próximos Passos

1. Implementar validações (Fase 5)
2. Criar exemplos completos (Fase 6)
3. Documentar justificativas (Fase 4)
4. Adicionar pre-commit hooks

## Referências

- Spec: `specs/01-stack-tecnologica.md`
- Constitution: `constitution.md`

