# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ENV PYTHONUNBUFFERED=1
ENV UV_COMPILE_BYTECODE=1

WORKDIR /app

# Copy dependency definition files
COPY pyproject.toml uv.lock ./

# Install dependencies
RUN uv sync --frozen --no-dev --no-install-project

# Add .venv/bin to PATH
ENV PATH="/app/.venv/bin:$PATH"

# Copy the rest of the application code
COPY . /app/

# Expose port 8000 for the MCP server
EXPOSE 8000

# Command to run the server
CMD ["python", "main.py"]




