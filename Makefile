build:
	dep ensure
	env GOOS=linux go build -ldflags="-s -w" -o bin/hello functions/hello/main.go
	env GOOS=linux go build -ldflags="-s -w" -o bin/world functions/world/main.go

test:
	go test -v ./...