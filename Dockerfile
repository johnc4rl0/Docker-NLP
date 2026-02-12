FROM python:3.12-slim

# Install GCC build dependency
RUN apt-get update && \
    apt-get install -y gcc g++

WORKDIR /app

COPY requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt

COPY *.py /app
COPY entrypoint.sh /app
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["05_language_translation.py"]