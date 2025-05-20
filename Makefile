# Makefile
# Use: $ make deploy
# Use: $ make undeploy
deploy:
	@echo "Verificando status da Podman Machine..."
	@if ! podman machine inspect --format "{{.State}}" | grep -q "running"; then \
		echo "Podman Machine nao esta rodando. Iniciando..."; \
		podman machine start; \
		echo "Aguardando a maquina Podman iniciar completamente..."; \
		sleep 30; \
	else \
		echo "Podman Machine ja esta rodando."; \
	fi
	@echo "Executando deploy..."
	# Uso sem Dockerfile (com a imagem original)
	# podman compose down -v && podman compose up -d 
	#
	# Uso com Dockerfile:
	podman compose down -v && podman compose up -d --build
	@echo "Deploy finalizado."

undeploy:
	@echo "Executando undeploy..."
	podman compose down -v && podman machine stop
	@echo "Undeploy finalizado."

.PHONY: deploy undeploy