# Tasks - Bekaa SaaS Starter

Este diretório contém tarefas acionáveis geradas a partir dos planos de implementação.

## Estrutura

As tarefas podem ser organizadas por:
- Produto/Feature
- Sprint/Iteração
- Prioridade

## Formato de Tarefa

Cada tarefa deve ter:

- **Título**: Claro e específico
- **Descrição**: O que precisa ser feito
- **Critérios de Aceitação**: Como saber que está completo
- **Dependências**: Outras tarefas que precisam ser concluídas primeiro
- **Estimativa**: Tempo ou story points

## Status

- ⏳ **Pendente** - Ainda não iniciada
- 🔄 **Em Progresso** - Sendo trabalhada
- ✅ **Concluída** - Finalizada e testada
- ❌ **Bloqueada** - Aguardando dependência
- 🚫 **Cancelada** - Não será implementada

## Integração com GitHub

Tarefas podem ser:
- Criadas como Issues no GitHub
- Linkadas a PRs
- Organizadas em Projects
- Rastreadas em Milestones

## Exemplo

```markdown
# Tarefa: Implementar login com Firebase

## Descrição
Implementar tela de login usando Firebase Auth

## Critérios de Aceitação
- [ ] Formulário de login funcional
- [ ] Validação de email e senha
- [ ] Tratamento de erros
- [ ] Redirecionamento após login
- [ ] Testes unitários

## Dependências
- [ ] Firebase configurado
- [ ] Design system implementado

## Estimativa
2 dias

## Status
⏳ Pendente
```

