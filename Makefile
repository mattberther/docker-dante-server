DOCKER_REPO = 
NAME = mattberther/dante-server

default: build

build:
	docker build -t $(NAME) .

build-nc:
	docker build --no-cache -t $(NAME) .

release: build-nc publish

publish: tag
	docker push $(DOCKER_REPO)/$(NAME):latest

tag:
	@echo 'create tag latest'
	docker tag $(NAME) $(DOCKER_REPO)/$(NAME):latest
