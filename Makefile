all: test build

build:
	$(eval VER=$(shell git rev-parse HEAD))
	@echo commit hash = $(VER)
	dep ensure
	env GOOS=linux go build -ldflags="-s -w -X main.AppVersion=$(VER)" -o bin/hello functions/hello/main.go
	env GOOS=linux go build -ldflags="-s -w -X main.AppVersion=$(VER)" -o bin/world functions/world/main.go

test:
	go test -v ./...