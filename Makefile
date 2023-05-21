NAME = ./srcs/docker-compose.yml

all: up

up:
	sudo mkdir -p /home/${USER}/data/wordpress
	sudo mkdir -p /home/${USER}/data/mariadb
	docker compose -f $(NAME) up --build

down:
	@docker compose -f ${NAME} down

clean:
	sudo rm -rf /home/${USER}/data/wordpress
	sudo rm -rf /home/${USER}/data/mariadb
	sudo docker system prune -f -a
	docker compose -f $(NAME) down
	docker stop `docker ps -qa`
	docker rm `docker ps -qa`
	docker rmi -f `docker images -qa`
	docker volume rm `docker volume ls -q`
	docker network rm `docker network ls -q`
.PHONY: all re up down clean
