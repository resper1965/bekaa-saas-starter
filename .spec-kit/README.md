# Spec-Kit - Bekaa SaaS Starter

Este diretório contém a estrutura do GitHub Spec-Kit para desenvolvimento orientado por especificações.

## O Que É Spec-Kit?

O Spec-Kit é uma metodologia de desenvolvimento que prioriza especificações claras antes da implementação, garantindo:

- ✅ Requisitos bem definidos
- ✅ Arquitetura pensada antes do código
- ✅ Documentação sempre atualizada
- ✅ Desenvolvimento mais eficiente

## Estrutura

```
.spec-kit/
├── constitution.md          # Princípios e diretrizes do projeto
├── specs/                   # Especificações de alto nível
│   └── template.md         # Template para novas specs
├── plans/                   # Planos de implementação detalhados
│   └── template.md         # Template para novos planos
└── tasks/                   # Tarefas acionáveis (geradas dos planos)
    └── README.md
```

## Workflow

### 1. Constitution (Princípios)

Leia `constitution.md` para entender os princípios fundamentais do projeto.

### 2. Specs (Especificações)

Crie especificações em `specs/` para:
- Novos produtos
- Features grandes
- Refatorações importantes
- Integrações complexas

Use `specs/template.md` como base.

### 3. Plans (Planos)

Crie planos detalhados em `plans/` para:
- Quebrar specs em fases
- Definir tarefas específicas
- Estimar esforço
- Planejar deploy

Use `plans/template.md` como base.

### 4. Tasks (Tarefas)

Quebre planos em tarefas acionáveis:
- Uma tarefa = uma PR
- Tarefas pequenas e focadas
- Critérios de aceitação claros

## Como Usar

### Criar Nova Especificação

```bash
# Copiar template
cp .spec-kit/specs/template.md .spec-kit/specs/meu-produto.md

# Editar e preencher
# Depois criar plano correspondente
```

### Criar Novo Plano

```bash
# Copiar template
cp .spec-kit/plans/template.md .spec-kit/plans/01-implementar-produto.md

# Editar e quebrar em tarefas
```

### Exemplo Completo

1. **Spec**: `specs/privacy-manager.md` - Especifica o produto Privacy Manager
2. **Plan**: `plans/01-privacy-manager-setup.md` - Plano de implementação
3. **Tasks**: Tarefas no GitHub Issues ou em `tasks/`

## Integração com GitHub

### Issues

Crie issues no GitHub baseadas nas specs:
- Link para a spec
- Checklist do plano
- Labels apropriados

### Pull Requests

Referencie specs e planos nos PRs:
```markdown
## Especificação
Closes #123 (spec: privacy-manager)

## Plano
Baseado em: plans/01-privacy-manager-setup.md

## Checklist
- [ ] RF-001 implementado
- [ ] Testes passando
- [ ] Documentação atualizada
```

## Boas Práticas

1. **Sempre comece com spec** - Não code sem especificar
2. **Mantenha atualizado** - Specs e planos devem refletir a realidade
3. **Quebre em pequenas partes** - Tarefas pequenas são mais gerenciáveis
4. **Documente decisões** - Por que, não apenas o que
5. **Revise regularmente** - Specs podem evoluir

## Templates

- `specs/template.md` - Template para especificações
- `plans/template.md` - Template para planos

## Exemplos

Veja exemplos em:
- `bekaa-platform/.spec-kit/` - Exemplos completos de specs e planos

## Recursos

- [GitHub Spec-Kit](https://github.com/github/spec-kit)
- [Documentação Spec-Kit](https://github.github.com/spec-kit/)

