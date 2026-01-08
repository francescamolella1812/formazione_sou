FROM python:3.12-slim

WORKDIR /app
COPY bank.py character.py /app/

RUN adduser --disabled-password --gecos "" appuser \
 && chown -R appuser:appuser /app

USER appuser

CMD ["python", "-u", "bank.py"]

