# Dockerfile for FIR development instance
#
# build with the command:
#
# sudo docker build -t fir .
# sudo docker run -it -p 8000:8000 fir
#
# then access http://localhost:8000 in your browser

FROM python:2.7.12

RUN addgroup fir && \
    useradd -g fir -s /sbin/nologin fir

WORKDIR /app/FIR

ADD requirements.txt /app/FIR/

RUN pip install -r requirements.txt

USER fir
ENV HOME /app/FIR
ENV USER fir
