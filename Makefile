MIX := mix
IEX := iex
ELIXIR := elixir

all: deps

check-tools:
	@if ! command -v $(ELIXIR) >/dev/null 2>&1; then \
		echo "Elixir not found. Please install Elixir manually."; \
		exit 1; \
	fi
	@if ! command -v $(MIX) >/dev/null 2>&1; then \
		echo "Mix not found. Please install Mix manually."; \
		exit 1; \
	fi

deps: check-tools
	@echo "Fetching dependencies..."
	@$(MIX) deps.get

test:
	@echo "Grading marksheets..."
	@$(MIX) test

compile:
	@echo "Compiling chaos..."
	@$(MIX) compile

clean:
	@$(MIX) clean

iex:
	$(IEX) -S $(MIX)

purge: clean
	@rm -rf _build deps
	@echo "Done!"

format:
	$(MIX) format

run:
	$(MIX) run

help:
	@echo "Available commands:"
	@echo "  make test  - Run mix test"
	@echo "  make deps    - Fetch dependencies"
	@echo "  make compile - Compile the project"
	@echo "  make clean   - Clean the project build"
	@echo "  make purge   - Clean and remove all build artifacts"
	@echo "  make iex     - Start interactive shell"
	@echo "  make format  - Format the code"
	@echo "  make run     - Run the application"

.PHONY: test
