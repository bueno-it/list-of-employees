FROM python:3.11-slim

# Instalar dependências do sistema para Playwright/Chromium
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    libnss3 \
    libnspr4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libdbus-1-3 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    libpango-1.0-0 \
    libcairo2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Instalar dependências Python
RUN pip install --no-cache-dir playwright openpyxl python-docx

# Instalar Chromium via Playwright
RUN playwright install chromium

COPY . .

CMD ["python", "scheduled_list_of_employees_linux.py"]
