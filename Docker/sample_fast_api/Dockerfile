FROM python:3.11-bullseye
ADD . /fastapi
WORKDIR /fastapi
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]