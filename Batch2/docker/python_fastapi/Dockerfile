FROM python:3-slim 
# taken base imge
ADD . /app
# copy curent folder into app
WORKDIR /app
# make /app my work directory
RUN pip install -r requirements.txt
# install dependencies
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]