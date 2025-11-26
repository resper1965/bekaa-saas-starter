# 🚀 Instalação e Uso do Bekaa SaaS Starter

## Instalação Rápida

### Opção 1: Usar o Gerador (Recomendado)

```bash
# Clone o template
git clone https://github.com/bekaa/bekaa-saas-starter.git
cd bekaa-saas-starter

# Execute o gerador
./tools/create-new-saas.sh
```

O script irá:
- ✅ Verificar dependências (Node.js, pnpm, GitHub CLI)
- ✅ Coletar informações do seu projeto
- ✅ Criar estrutura completa
- ✅ Inicializar Git
- ✅ Criar repositório no GitHub (opcional)
- ✅ Instalar dependências

### Opção 2: Uso Manual

```bash
# Clone o template
git clone https://github.com/bekaa/bekaa-saas-starter.git meu-projeto
cd meu-projeto

# Instalar dependências
pnpm install

# Configurar ambiente
cp .env.example .env
# Editar .env com suas credenciais

# Setup database
pnpm db:migrate

# Iniciar desenvolvimento
pnpm dev
```

## O Que o Gerador Faz

### 1. Verifica Dependências

- **Node.js 20+**: Requerido
- **pnpm**: Instalado automaticamente se não existir
- **GitHub CLI**: Opcional, mas recomendado

### 2. Coleta Informações

- Nome do projeto (kebab-case)
- Descrição
- Marca/Wordmark
- Domínio
- Preferência de repositório GitHub

### 3. Cria Estrutura

```
meu-projeto/
├── apps/              # Aplicações
├── packages/          # Pacotes compartilhados
├── tools/             # Ferramentas
├── docs/              # Documentação
└── ...
```

### 4. Configura Projeto

- Atualiza `package.json` com nome do projeto
- Cria `README.md` customizado
- Configura `.env.example`
- Inicializa Git

### 5. Cria Repositório GitHub (Opcional)

- Cria repositório privado
- Adiciona remote
- Faz push inicial

## Exemplo de Uso

```bash
$ ./tools/create-new-saas.sh

╔════════════════════════════════════════════════════════╗
║                                                        ║
║          🚀 BEKAA SAAS STARTER GENERATOR 🚀           ║
║                                                        ║
║     Cria plataforma multi-SaaS completa em minutos    ║
║                                                        ║
╚════════════════════════════════════════════════════════╝

🔍 Verificando dependências...
✅ Dependências verificadas

📋 Vamos configurar seu projeto:

Nome do projeto (ex: documento-ness): documento-ness
Descrição (ex: Plataforma de documentos): Plataforma de documentos
Marca/Wordmark (ex: ness): ness
Domínio (ex: documento.ness.com.br): documento.ness.com.br
Criar repo privado no GitHub? (y/n): y
Diretório de destino (default: ~/projects): 

════════════════════════════════════════
Configuração:
  📦 Projeto: documento-ness
  📝 Descrição: Plataforma de documentos
  🏷️  Marca: ness
  🌐 Domínio: documento.ness.com.br
  🔒 GitHub: y
  📁 Destino: ~/projects/documento-ness
════════════════════════════════════════

Confirma e continua? (y/n): y

📁 Criando estrutura do projeto...
📦 Copiando template do bekaa-saas-starter...
✅ Estrutura criada
🔧 Inicializando Git...
🐙 Criando repositório no GitHub...
✅ Repositório criado no GitHub
📦 Instalando dependências...

╔════════════════════════════════════════╗
║     ✅ PROJETO CRIADO COM SUCESSO!     ║
╚════════════════════════════════════════╝

📋 Próximos passos:

  1. cd ~/projects/documento-ness
  2. cp .env.example .env
  3. Edite .env com suas credenciais
  4. pnpm db:migrate
  5. pnpm dev
```

## Troubleshooting

### Erro: Node.js não encontrado

```bash
# Instalar Node.js 20+
# Via nvm (recomendado)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install 20
nvm use 20
```

### Erro: pnpm não encontrado

O script tenta instalar automaticamente. Se falhar:

```bash
npm install -g pnpm
```

### Erro: GitHub CLI não encontrado

O script oferece instalação automática. Ou instale manualmente:

**Linux:**
```bash
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update && sudo apt install gh -y
gh auth login
```

**macOS:**
```bash
brew install gh
gh auth login
```

### Erro: Diretório já existe

O script pergunta se deseja remover e recriar. Ou remova manualmente:

```bash
rm -rf ~/projects/meu-projeto
```

## Próximos Passos

Após criar o projeto:

1. **Configure Firebase**: Crie projeto e adicione credenciais no `.env`
2. **Setup Database**: Configure PostgreSQL ou Cloud SQL
3. **Crie Primeiro Produto**: `pnpm generate:product`
4. **Desenvolva**: `pnpm dev`
5. **Deploy**: Siga `docs/deployment.md`

## Suporte

- 📚 Documentação: `docs/`
- 🐛 Issues: GitHub Issues
- 💬 Discussões: GitHub Discussions

