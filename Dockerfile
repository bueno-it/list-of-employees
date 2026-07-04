FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    libnss3 libnspr4 libatk1.0-0 libatk-bridge2.0-0 \
    libcups2 libdrm2 libdbus-1-3 libxkbcommon0 \
    libxcomposite1 libxdamage1 libxfixes3 libxrandr2 \
    libgbm1 libasound2 libpango-1.0-0 libcairo2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install --no-cache-dir playwright openpyxl python-docx

RUN playwright install chromium

COPY . .

# Criar o flag que indica que o setup já foi feito
RUN mkdir -p /root && touch /root/.holiday_balance_setup_done

CMD ["python", "scheduled_list_of_employees_linux.py"]
