OUTPUT_BINARY := blogService
MAIN_ENTRY    := main.go

.PHONY: build start format

build:
	@echo "===> Building the Go project..."
	go build -o tmp/$(OUTPUT_BINARY) $(MAIN_ENTRY)
	@echo "===> Build completed."

start: build
	@echo "===> Starting binary..."
	./tmp/$(OUTPUT_BINARY)

run:
	@echo "===> Starting the Go application..."
	go run $(MAIN_ENTRY)

tidy:
	@echo "===> Formatting Go source code..."
	go fmt ./...
	@echo "===> Updating and tidying Go modules..."
	go get -u ./...
	go mod tidy
