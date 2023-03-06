FROM python:3.9-alpine3.13
LABEL maintainer="requrv.io"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
# copy the requirements for development project
COPY ./requirements.dev.txt /tmp/requirements.dev.txt 
COPY ./app /app
WORKDIR /app
EXPOSE 8000

# define the DEV variable 
ARG DEV=false
# in the bash script I define the condition to copy the requirements.dev.txt
RUN python -m venv /py && \ 
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
    then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
    --disabled-password \
    --no-create-home \
    django-user

ENV PATH="/py/bin:$PATH"

USER django-user

