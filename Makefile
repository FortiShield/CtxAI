# CtxAI Makefile
# Dynamic agentic AI framework development automation

.PHONY: help install dev test lint format clean docker docker-build docker-run run-ui run-tunnel setup pre-commit check-deps update-deps docs serve-docs

# Default target
.DEFAULT_GOAL := help

# Variables
PYTHON := python3
VENV := .venv
UV := uv
DOCKER_IMAGE := ctxos/ctxai
DOCKER_TAG := latest
PORT := 50001

# Colors for output
RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[1;33m
BLUE := \033[0;34m
PURPLE := \033[0;35m
CYAN := \033[0;36m
NC := \033[0m # No Color

help: ## Show this help message
	@echo "$(CYAN)CtxAI Development Commands$(NC)"
	@echo ""
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  $(GREEN)%-20s$(NC) %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ""
	@echo "$(YELLOW)Quick Start:$(NC)"
	@echo "  make install      # Install dependencies"
	@echo "  make dev          # Start development server"
	@echo "  make docker-run  # Run with Docker"

# Installation & Setup
install: ## Install project dependencies
	@echo "$(BLUE)Installing CtxAI dependencies...$(NC)"
	@if command -v $(UV) >/dev/null 2>&1; then \
		echo "$(GREEN)Using UV package manager...$(NC)"; \
		$(UV) sync; \
	else \
		echo "$(YELLOW)UV not found, using pip...$(NC)"; \
		$(PYTHON) -m pip install -r requirements.txt; \
		$(PYTHON) -m pip install -r requirements2.txt; \
	fi
	@echo "$(GREEN)Installation complete!$(NC)"

setup: ## Set up development environment
	@echo "$(BLUE)Setting up CtxAI development environment...$(NC)"
	@if [ ! -d "$(VENV)" ]; then \
		echo "$(YELLOW)Creating virtual environment...$(NC)"; \
		$(PYTHON) -m venv $(VENV); \
	fi
	@echo "$(BLUE)Activating virtual environment and installing dependencies...$(NC)"
	@. $(VENV)/bin/activate && make install
	@echo "$(GREEN)Development environment ready!$(NC)"

pre-commit: ## Set up pre-commit hooks
	@echo "$(BLUE)Setting up pre-commit hooks...$(NC)"
	@if command -v pre-commit >/dev/null 2>&1; then \
		pre-commit install; \
		echo "$(GREEN)Pre-commit hooks installed!$(NC)"; \
	else \
		echo "$(YELLOW)Installing pre-commit...$(NC)"; \
		$(PYTHON) -m pip install pre-commit; \
		pre-commit install; \
		echo "$(GREEN)Pre-commit hooks installed!$(NC)"; \
	fi

# Development
dev: ## Start development server (WebUI)
	@echo "$(BLUE)Starting CtxAI WebUI development server...$(NC)"
	@echo "$(CYAN)Access at: http://localhost:$(PORT)$(NC)"
	@if command -v $(UV) >/dev/null 2>&1; then \
		$(UV) run $(PYTHON) run_ui.py; \
	else \
		$(PYTHON) run_ui.py; \
	fi

run-ui: ## Alias for dev target
	@$(MAKE) dev

run-tunnel: ## Start tunnel for remote access
	@echo "$(BLUE)Starting tunnel for remote access...$(NC)"
	@$(PYTHON) run_tunnel.py

# Testing
test: ## Run all tests
	@echo "$(BLUE)Running tests...$(NC)"
	@if command -v $(UV) >/dev/null 2>&1; then \
		$(UV) run pytest; \
	else \
		$(PYTHON) -m pytest; \
	fi

test-coverage: ## Run tests with coverage report
	@echo "$(BLUE)Running tests with coverage...$(NC)"
	@if command -v $(UV) >/dev/null 2>&1; then \
		$(UV) run pytest --cov=.; \
	else \
		$(PYTHON) -m pytest --cov=.; \
	fi

test-watch: ## Run tests in watch mode
	@echo "$(BLUE)Running tests in watch mode...$(NC)"
	@if command -v $(UV) >/dev/null 2>&1; then \
		$(UV) run pytest --watch; \
	else \
		$(PYTHON) -m pytest --watch; \
	fi

# Code Quality
lint: ## Run linting checks
	@echo "$(BLUE)Running linter...$(NC)"
	@if command -v ruff >/dev/null 2>&1; then \
		ruff check .; \
	else \
		echo "$(YELLOW)Ruff not found, installing...$(NC)"; \
		$(PYTHON) -m pip install ruff; \
		ruff check .; \
	fi

format: ## Format code with ruff
	@echo "$(BLUE)Formatting code...$(NC)"
	@if command -v ruff >/dev/null 2>&1; then \
		ruff format .; \
	else \
		echo "$(YELLOW)Ruff not found, installing...$(NC)"; \
		$(PYTHON) -m pip install ruff; \
		ruff format .; \
	fi

type-check: ## Run type checking with mypy
	@echo "$(BLUE)Running type checks...$(NC)"
	@if command -v mypy >/dev/null 2>&1; then \
		mypy .; \
	else \
		echo "$(YELLOW)MyPy not found, installing...$(NC)"; \
		$(PYTHON) -m pip install mypy; \
		mypy .; \
	fi

check-deps: ## Check for outdated dependencies
	@echo "$(BLUE)Checking for outdated dependencies...$(NC)"
	@if command -v $(UV) >/dev/null 2>&1; then \
		$(UV) tree --outdated; \
	else \
		$(PYTHON) -m pip list --outdated; \
	fi

update-deps: ## Update dependencies
	@echo "$(BLUE)Updating dependencies...$(NC)"
	@if command -v $(UV) >/dev/null 2>&1; then \
		$(UV) sync --upgrade; \
	else \
		echo "$(YELLOW)Updating requirements...$(NC)"; \
		$(PYTHON) -m pip install --upgrade -r requirements.txt; \
		$(PYTHON) -m pip install --upgrade -r requirements2.txt; \
	fi

# Docker
docker-build: ## Build Docker image
	@echo "$(BLUE)Building Docker image $(DOCKER_IMAGE):$(DOCKER_TAG)...$(NC)"
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) .

docker-run: ## Run CtxAI with Docker
	@echo "$(BLUE)Running CtxAI with Docker...$(NC)"
	@echo "$(CYAN)Access at: http://localhost:$(PORT)$(NC)"
	docker run -p $(PORT):80 $(DOCKER_IMAGE):$(DOCKER_TAG)

docker-dev: ## Run development environment with Docker Compose
	@echo "$(BLUE)Starting development environment with Docker Compose...$(NC)"
	cd docker/run && docker-compose up

docker-stop: ## Stop Docker Compose services
	@echo "$(BLUE)Stopping Docker Compose services...$(NC)"
	cd docker/run && docker-compose down

# Documentation
docs: ## Generate documentation
	@echo "$(BLUE)Generating documentation...$(NC)"
	@echo "$(YELLOW)Documentation generation not yet implemented$(NC)"

serve-docs: ## Serve documentation locally
	@echo "$(BLUE)Serving documentation locally...$(NC)"
	@echo "$(CYAN)Access at: http://localhost:8000$(NC)"
	@if command -v mkdocs >/dev/null 2>&1; then \
		mkdocs serve; \
	else \
		echo "$(YELLOW)MkDocs not found. Install with: pip install mkdocs$(NC)"; \
	fi

# Maintenance
clean: ## Clean up generated files and caches
	@echo "$(BLUE)Cleaning up...$(NC)"
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete 2>/dev/null || true
	find . -type f -name "*.pyo" -delete 2>/dev/null || true
	find . -type d -name "*.egg-info" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".pytest_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".mypy_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".ruff_cache" -exec rm -rf {} + 2>/dev/null || true
	rm -rf .coverage htmlcov/ 2>/dev/null || true
	rm -rf dist/ build/ 2>/dev/null || true
	@echo "$(GREEN)Cleanup complete!$(NC)"

clean-all: clean ## Clean everything including virtual environment
	@echo "$(BLUE)Removing virtual environment...$(NC)"
	rm -rf $(VENV)
	@echo "$(GREEN)Deep cleanup complete!$(NC)"

# Development Workflow
check: lint type-check test ## Run all quality checks (lint, type-check, test)

ci: clean install check ## Full CI pipeline simulation

# Plugin Development
plugin-create: ## Create a new plugin (usage: make plugin-create NAME=myplugin)
	@if [ -z "$(NAME)" ]; then \
		echo "$(RED)Error: Plugin name required$(NC)"; \
		echo "Usage: make plugin-create NAME=myplugin"; \
		exit 1; \
	fi
	@echo "$(BLUE)Creating plugin: $(NAME)$(NC)"
	mkdir -p usr/plugins/$(NAME)/{api,tools,webui,extensions}
	@echo "$(GREEN)Plugin structure created in usr/plugins/$(NAME)$(NC)"
	@echo "$(YELLOW)Don't forget to create plugin.yaml configuration!$(NC)"

# Project Management
backup: ## Create backup of user data
	@echo "$(BLUE)Creating backup...$(NC)"
	@if [ -d "usr" ]; then \
		tar -czf ctxai-backup-$$(date +%Y%m%d-%H%M%S).tar.gz usr/; \
		echo "$(GREEN)Backup created!$(NC)"; \
	else \
		echo "$(YELLOW)No usr/ directory found to backup$(NC)"; \
	fi

# Status & Info
status: ## Show project status
	@echo "$(CYAN)CtxAI Project Status$(NC)"
	@echo "=================="
	@echo "$(BLUE)Python Version:$(NC) $$($(PYTHON) --version 2>/dev/null || echo 'Not found')"
	@echo "$(BLUE)UV Available:$(NC) $$(command -v $(UV) >/dev/null 2>&1 && echo 'Yes' || echo 'No')"
	@echo "$(BLUE)Virtual Env:$(NC) $$([ -d "$(VENV)" ] && echo 'Exists' || echo 'Not found')"
	@echo "$(BLUE)Git Status:$(NC) $$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ') modified files"
	@echo "$(BLUE)Docker Image:$(NC) $$(docker images -q $(DOCKER_IMAGE):$(DOCKER_TAG) 2>/dev/null | wc -l | tr -d ' ') images"

# Quick commands for common tasks
quick-install: ## Quick install for production
	@echo "$(BLUE)Quick install for production...$(NC)"
	pip install -r requirements.txt
	pip install -r requirements2.txt

quick-dev: ## Quick development setup
	@echo "$(BLUE)Quick development setup...$(NC)"
	pip install -r requirements.dev.txt 2>/dev/null || echo "Dev requirements not found"

# Browser Agent Setup
browser-setup: ## Install browser dependencies for browser agent
	@echo "$(BLUE)Setting up browser agent dependencies...$(NC)"
	@if command -v $(UV) >/dev/null 2>&1; then \
		$(UV) run playwright install chromium; \
	else \
		$(PYTHON) -m playwright install chromium; \
	fi
	@echo "$(GREEN)Browser agent setup complete!$(NC)"
