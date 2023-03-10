# Definição de cores
YELLOW=\033[1;33m
GREEN=\033[0;32m
RED=\033[0;31m
RESET=\033[0m

# Definição de variáveis
SAIL = ./vendor/bin/sail
ENV_FILE = .env

# Comandos
install:
	@echo "${YELLOW}Adicionando variável APP_PORT no arquivo .env${RESET}"
	@echo "APP_PORT=8000" >> $(ENV_FILE)
	@echo "${YELLOW}Iniciando containers do Laravel Sail${RESET}"
	$(SAIL) up -d --build
	@echo "${YELLOW}Instalando dependências do Composer${RESET}"
	$(SAIL) composer install --ignore-platform-reqs
	@echo "${YELLOW}Instalando dependências do NPM${RESET}"
	$(SAIL) npm install
	@echo "${YELLOW}Gerando chave de aplicação${RESET}"
	$(SAIL) artisan key:generate
	@echo "${YELLOW}Executando migrações e seeders${RESET}"
	$(SAIL) artisan migrate --seed
	@echo "${GREEN}Instalação concluída com sucesso!${RESET}"

start:
	@echo "${YELLOW}Iniciando containers do Laravel Sail${RESET}"
	$(SAIL) up -d
	$(SAIL) npm run dev
	@echo "${GREEN}Containers iniciados com sucesso!${RESET}"

stop:
	@echo "${YELLOW}Encerrando containers do Laravel Sail${RESET}"
	$(SAIL) down
	@echo "${GREEN}Containers encerrados com sucesso!${RESET}"

test:
	@echo "${YELLOW}Executando testes da aplicação${RESET}"
	$(SAIL) test
	@echo "${GREEN}Testes concluídos com sucesso!${RESET}"

clean:
	@echo "${YELLOW}Limpando cache da aplicação${RESET}"
	$(SAIL) artisan cache:clear
	$(SAIL) artisan config:clear
	$(SAIL) artisan route:clear
	$(SAIL) artisan view:clear
	@echo "${GREEN}Cache limpo com sucesso!${RESET}"
