#!/bin/bash

# 🎨 Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
echo "╔════════════════════════════════════════════════════════╗"
echo "║                                                        ║"
echo "║          🚀 BEKAA SAAS STARTER GENERATOR 🚀           ║"
echo "║                                                        ║"
echo "║     Cria plataforma multi-SaaS completa em minutos    ║"
echo "║                                                        ║"
echo "╚════════════════════════════════════════════════════════╝"
echo -e "${NC}\n"

# Verificar dependências
echo -e "${CYAN}🔍 Verificando dependências...${NC}"

if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js não encontrado. Instale: https://nodejs.org${NC}"
    exit 1
fi

NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 20 ]; then
    echo -e "${RED}❌ Node.js 20+ é necessário. Versão atual: $(node --version)${NC}"
    exit 1
fi

if ! command -v pnpm &> /dev/null; then
    echo -e "${YELLOW}📦 pnpm não encontrado. Instalando...${NC}"
    npm install -g pnpm
fi

if ! command -v gh &> /dev/null; then
    echo -e "${YELLOW}⚠️  GitHub CLI não encontrado.${NC}"
    echo -e "${YELLOW}Instalar agora? (y/n)${NC}"
    read -r install_gh
    if [[ $install_gh =~ ^[Yy]$ ]]; then
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
            sudo apt update && sudo apt install gh -y
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            brew install gh
        fi
        echo -e "${CYAN}🔐 Faça login no GitHub:${NC}"
        gh auth login
    else
        echo -e "${YELLOW}⚠️  GitHub CLI não instalado. Repositório não será criado automaticamente.${NC}"
    fi
fi

echo -e "${GREEN}✅ Dependências verificadas${NC}\n"

# Coletar informações
echo -e "${PURPLE}📋 Vamos configurar seu projeto:${NC}\n"

read -p "$(echo -e ${CYAN}Nome do projeto ${YELLOW}(ex: documento-ness)${NC}: )" PROJECT_NAME
PROJECT_NAME=${PROJECT_NAME:-"my-saas"}

# Validar nome (kebab-case)
if [[ ! "$PROJECT_NAME" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    echo -e "${RED}❌ Nome inválido. Use apenas letras minúsculas, números e hífens (kebab-case)${NC}"
    exit 1
fi

read -p "$(echo -e ${CYAN}Descrição ${YELLOW}(ex: Plataforma de documentos)${NC}: )" PROJECT_DESC
PROJECT_DESC=${PROJECT_DESC:-"Multi-SaaS Platform"}

read -p "$(echo -e ${CYAN}Marca/Wordmark ${YELLOW}(ex: ness)${NC}: )" BRAND_NAME
BRAND_NAME=${BRAND_NAME:-"saas"}

read -p "$(echo -e ${CYAN}Domínio ${YELLOW}(ex: documento.ness.com.br)${NC}: )" DOMAIN
DOMAIN=${DOMAIN:-"$PROJECT_NAME.com"}

read -p "$(echo -e ${CYAN}Criar repo privado no GitHub? ${YELLOW}(y/n)${NC}: )" CREATE_GITHUB
CREATE_GITHUB=${CREATE_GITHUB:-"y"}

read -p "$(echo -e ${CYAN}Diretório de destino ${YELLOW}(default: ~/projects)${NC}: )" DEST_DIR
DEST_DIR=${DEST_DIR:-"$HOME/projects"}

echo -e "\n${BLUE}════════════════════════════════════════${NC}"
echo -e "${GREEN}Configuração:${NC}"
echo -e "  📦 Projeto: ${YELLOW}$PROJECT_NAME${NC}"
echo -e "  📝 Descrição: ${YELLOW}$PROJECT_DESC${NC}"
echo -e "  🏷️  Marca: ${YELLOW}$BRAND_NAME${NC}"
echo -e "  🌐 Domínio: ${YELLOW}$DOMAIN${NC}"
echo -e "  🔒 GitHub: ${YELLOW}$CREATE_GITHUB${NC}"
echo -e "  📁 Destino: ${YELLOW}$DEST_DIR/$PROJECT_NAME${NC}"
echo -e "${BLUE}════════════════════════════════════════${NC}\n"

read -p "$(echo -e ${YELLOW}Confirma e continua? ${NC}(y/n): )" CONFIRM
if [[ ! $CONFIRM =~ ^[Yy]$ ]]; then
    echo -e "${RED}❌ Cancelado.${NC}"
    exit 0
fi

# Criar diretório
echo -e "\n${CYAN}📁 Criando estrutura do projeto...${NC}"
mkdir -p "$DEST_DIR"
cd "$DEST_DIR"

if [ -d "$PROJECT_NAME" ]; then
    echo -e "${RED}❌ Diretório $PROJECT_NAME já existe!${NC}"
    read -p "$(echo -e ${YELLOW}Remover e recriar? ${NC}(y/n): )" REMOVE
    if [[ $REMOVE =~ ^[Yy]$ ]]; then
        rm -rf "$PROJECT_NAME"
    else
        echo -e "${RED}❌ Cancelado.${NC}"
        exit 1
    fi
fi

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Obter diretório do template (assumindo que estamos no bekaa-saas-starter)
TEMPLATE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

echo -e "${CYAN}📦 Copiando template do bekaa-saas-starter...${NC}"

# Copiar estrutura base
if [ -d "$TEMPLATE_DIR" ]; then
    # Copiar arquivos essenciais
    cp -r "$TEMPLATE_DIR/packages" . 2>/dev/null || true
    cp -r "$TEMPLATE_DIR/tools" . 2>/dev/null || true
    cp -r "$TEMPLATE_DIR/docs" . 2>/dev/null || true
    cp "$TEMPLATE_DIR/package.json" . 2>/dev/null || true
    cp "$TEMPLATE_DIR/pnpm-workspace.yaml" . 2>/dev/null || true
    cp "$TEMPLATE_DIR/turbo.json" . 2>/dev/null || true
    cp "$TEMPLATE_DIR/tsconfig.json" . 2>/dev/null || true
    cp "$TEMPLATE_DIR/.gitignore" . 2>/dev/null || true
    cp "$TEMPLATE_DIR/.env.example" . 2>/dev/null || true
else
    echo -e "${YELLOW}⚠️  Template não encontrado. Criando estrutura básica...${NC}"
fi

# Atualizar package.json com nome do projeto
if [ -f "package.json" ]; then
    sed -i.bak "s/\"name\": \"bekaa-saas-starter\"/\"name\": \"$PROJECT_NAME\"/" package.json
    rm -f package.json.bak
fi

# Criar README customizado
cat > README.md <<EOF
# $PROJECT_NAME

> $PROJECT_DESC

## 🚀 Plataforma Multi-SaaS

**Marca:** $BRAND_NAME.  
**Domínio:** $DOMAIN

## Quick Start

\`\`\`bash
# Install
pnpm install

# Setup database
pnpm db:migrate

# Start dev
pnpm dev
\`\`\`

## Criar Novo Produto

\`\`\`bash
pnpm generate:product
\`\`\`

## Deploy

\`\`\`bash
# Build
pnpm build

# Deploy to Cloud Run
gcloud run deploy
\`\`\`

---

**Powered by Bekaa SaaS Starter**
EOF

# Atualizar .env.example
if [ -f ".env.example" ]; then
    DB_NAME=$(echo "$PROJECT_NAME" | tr '-' '_')
    sed -i.bak "s/bekaa_dev/${DB_NAME}_dev/g" .env.example
    sed -i.bak "s/bekaa-platform/$PROJECT_NAME/g" .env.example
    rm -f .env.example.bak
fi

# Criar estrutura de diretórios se não existir
mkdir -p apps/{web,api,scripts}
mkdir -p .github/workflows

echo -e "${GREEN}✅ Estrutura criada${NC}\n"

# Inicializar Git
echo -e "${CYAN}🔧 Inicializando Git...${NC}"
git init
git add .
git commit -m "Initial commit: $PROJECT_NAME" || true

# Criar repositório no GitHub
if [[ $CREATE_GITHUB =~ ^[Yy]$ ]] && command -v gh &> /dev/null; then
    echo -e "${CYAN}🐙 Criando repositório no GitHub...${NC}"
    
    # Verificar se está autenticado
    if ! gh auth status &> /dev/null; then
        echo -e "${YELLOW}⚠️  Não autenticado no GitHub. Fazendo login...${NC}"
        gh auth login
    fi
    
    # Criar repositório privado
    gh repo create "$PROJECT_NAME" \
        --private \
        --description "$PROJECT_DESC" \
        --source=. \
        --remote=origin \
        --push 2>/dev/null || {
        echo -e "${YELLOW}⚠️  Erro ao criar repositório. Tentando adicionar remote manualmente...${NC}"
        gh repo create "$PROJECT_NAME" --private --description "$PROJECT_DESC" || true
        git remote add origin "https://github.com/$(gh api user --jq .login)/$PROJECT_NAME.git" 2>/dev/null || true
        git push -u origin main 2>/dev/null || git push -u origin master 2>/dev/null || true
    }
    
    echo -e "${GREEN}✅ Repositório criado no GitHub${NC}\n"
elif [[ $CREATE_GITHUB =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}⚠️  GitHub CLI não disponível. Crie o repositório manualmente.${NC}\n"
fi

# Instalar dependências
echo -e "${CYAN}📦 Instalando dependências...${NC}"
pnpm install || {
    echo -e "${YELLOW}⚠️  Erro ao instalar dependências. Execute manualmente: pnpm install${NC}"
}

# Resumo final
echo -e "\n${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║     ✅ PROJETO CRIADO COM SUCESSO!     ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}\n"

echo -e "${CYAN}📋 Próximos passos:${NC}\n"
echo -e "  ${YELLOW}1.${NC} cd $DEST_DIR/$PROJECT_NAME"
echo -e "  ${YELLOW}2.${NC} cp .env.example .env"
echo -e "  ${YELLOW}3.${NC} Edite .env com suas credenciais"
echo -e "  ${YELLOW}4.${NC} pnpm db:migrate"
echo -e "  ${YELLOW}5.${NC} pnpm dev"
echo -e "\n${CYAN}📚 Documentação:${NC}"
echo -e "  ${BLUE}→${NC} docs/getting-started.md"
echo -e "  ${BLUE}→${NC} docs/creating-products.md"
echo -e "\n${CYAN}🛠️  Criar primeiro produto:${NC}"
echo -e "  ${BLUE}→${NC} pnpm generate:product"
echo -e "\n${GREEN}✨ Boa sorte com seu projeto!${NC}\n"

