PORT := 8080

.PHONY: all build run clean clean-binary

all: build clean

build:
	docker build -t neighborhood999/fiven1-backend .

run:
	docker run --rm -p ${PORT}:8000 neighborhood999/fiven1-backend

clean:
	@echo "\033[0;32mDelete all untagged/dangling (<none>) images...\033[0m"
	docker rmi `docker images -q -f dangling=true`

clean-binary:
	go clean -x -i ./...
