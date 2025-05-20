# Dockerfile
# Customização para instalar módulos da comunidade direto na imagem a exemplo do Tavily

FROM n8nio/n8n

USER root

RUN mkdir -p /home/node/.n8n/nodes && \
    chown -R node:node /home/node/.n8n

USER node

WORKDIR /home/node/.n8n/nodes

RUN npm install n8n-nodes-tavily