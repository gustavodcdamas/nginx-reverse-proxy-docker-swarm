# Uma pequena colinha para ajudar nos estudos

## Estrutura docker-swarm completa para produçao

Contem nginx (já com CertBot) dockerizado configurado como proxy reverso para diversas aplicaçoes como:
- Nextcloud
- Cal.com
- Chatwoot
- Dify
- Easy Appointments
- Evolution API
- Grafana
- MailCow
- Mysql
- N8N (Queue mode & normal mode)
- Odoo ERP
- Perfex CRM
- Portainer
- PostgreSQL
- Prometheus
- RabbitMQ
- Redis
- Supabase
- TypeBot
- Zabbix

### Realizar o build da imagem docker
```sh
docker compose build
```

### Realizar o up da imagem docker
```sh
docker compose up
```

## Ambiente de Produção
- Ter configurado o server_name corretamente no arquivo `./nginx/sites-available/app.conf`
- Iniciar o Docker Swarm
```sh
docker swarm init
```
- Criar rede overlay para o swarm
```sh
docker network create -d overlay --attachable net_swarm
```

- Execute o comando `sh sh-up.sh` para realizar todos os processos necessários para rodar a imagem no ambiente.
### Criando certificado
- Acesse o container docker do nginx, e então execute o seguinte comando:
```sh
certbot --nginx
```
- Feito isso basta seguir informações e configurando as configurações que forem solicitadas.

### Renovar certificado
- Repita o mesmo passo da criação de certificado
