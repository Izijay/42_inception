#Colors:
#####################
BOLD = \\033[1m
BLUE = \\033[0;34m
CYAN = \\033[36m
GREEN = \\033[32m
ORANGE = \\033[93m
PURPLE = \\033[0;95m
RED = \\033[0;91m
END = \\033[0m
#####################

all: start

stop:
	@echo "\t\t$(BOLD)$(PURPLE)Stopping all Containers$(END)"
	docker-compose -f srcs/docker-compose.yml stop

clean:
	@echo "\t\t$(BOLD)$(PURPLE)Cleaning cache files and volumes...$(END)"
	docker system prune -f
	sudo rm -rf ~/data

fclean:
	@echo "\t\t$(BOLD)$(PURPLE)Stopping all Containers and deleting images and networks...$(END)"
	docker-compose -f srcs/docker-compose.yml down -v --rmi all

re: fclean clean
	@echo "\t\t$(BOLD)$(GREEN)Build images and Starting all containers...$(END)"
	@sudo mkdir -p /home/mdupuis/data/database
	@sudo mkdir -p /home/mdupuis/data/wordpress
	docker-compose -f srcs/docker-compose.yml up --build

start:
	@echo "\t\t$(BOLD)$(GREEN)Build images and Starting all containers...$(END)"
	@sudo mkdir -p /home/mdupuis/data/database
	@sudo mkdir -p /home/mdupuis/data/wordpress
	docker-compose -f srcs/docker-compose.yml up --build

.PHONY: all start stop clean re fclean
