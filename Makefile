PORT := 8080

build:
	docker build -t neighborhood999/fiven1-backend .

run:
	docker run --rm -p ${PORT}:8000 neighborhood999/fiven1-backend
