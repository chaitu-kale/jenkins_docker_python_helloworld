FROM python:3.9-slim-bluster
WORKDIR /app
COPY hello.py /app
CMD ["python3","hello.py"]
