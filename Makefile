OUTPUT_BINARY := blogService
MAIN_ENTRY    := main.go

.PHONY: build start format

build:
	@echo "===> Building the Go project..."
	go build -o tmp/$(OUTPUT_BINARY) $(MAIN_ENTRY)
	@echo "===> Build completed."

dev:
	@echo "===> Starting the Go application..."
	go run $(MAIN_ENTRY)

start: build
	@echo "===> Starting the Go application..."
	./tmp/$(OUTPUT_BINARY)

tidy:
	@echo "===> Formatting Go source code..."
	go fmt ./...
	@echo "===> Updating and tidying Go modules..."
	go get -u ./...
	go mod tidy
