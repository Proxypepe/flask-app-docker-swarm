ARG python=python:3.9-alpine

FROM ${python} as build
WORKDIR /code

COPY requirements.txt .
RUN python3 -m venv /venv
ENV PATH=/venv/bin:$PATH

RUN apk update  \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir --upgrade  -r requirements.txt


FROM ${python}
COPY --from=build /venv /venv
ARG USER_PASSWORD=1234
WORKDIR /code

RUN echo ${USER_PASSWORD} &&\
     adduser -D alex &&\
    echo alex:${USER_PASSWORD} | chpasswd -

ENV PATH=/venv/bin:$PATH
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY . .

USER alex

CMD ["python3", "hello.py"]
