FROM tiangolo/uvicorn-gunicorn
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . /code/
EXPOSE 8000
CMD ["gunicorn", "-b", ":8000", "config.wsgi:application"]