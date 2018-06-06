PORT := 8080

all: build clean

.PHONY: build
build:
	docker build -t neighborhood999/fiven1-backend .

.PHONY: run
run:
	docker run --rm -p $(PORT):8000 neighborhood999/fiven1-backend

.PHONY: update_dep
update_dep:
	dep ensure --update

.PHONY: clean
clean:
	@echo "\033[0;32mDelete all untagged/dangling (<none>) images...\033[0m"
	docker rmi `docker images -q -f dangling=true`

.PHONY: clean_binary
clean_binary:
	go clean -x -i ./...
