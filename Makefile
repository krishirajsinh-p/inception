all: up

up:
	mkdir -p /home/${USER}/data/wordpress
	mkdir -p /home/${USER}/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down -v --remove-orphans

start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

status:
	docker ps -a

fclean: down
	# docker rm $$(docker ps -qa)
	# docker rmi -f $$(docker images -qa)
	sudo rm -rf /home/${USER}/data

.PHONY: all up down start stop status fclean