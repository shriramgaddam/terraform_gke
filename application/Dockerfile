FROM python:3.7-slim

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY src/ .

EXPOSE 8000

# ENTRYPOINT [ "python", "main.py", "--prod=True" ]
ENTRYPOINT [ "python", "api.py" ]