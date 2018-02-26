FROM alpine:3.5

#RUN apt update && apt install -y git build-essential
RUN apk add --update git alpine-sdk

RUN git clone https://github.com/edwardhey/beanstalkd && mkdir /data

ENV BEANSTALKD_PORT 11300
ENV BEANSTALKD_ADDR 0.0.0.0
ENV BEANSTALKD_DIR  /data
ENV BEANSTALKD_MAX_JOB_SIZE 65535

WORKDIR beanstalkd
RUN make && make install

EXPOSE $BEANSTALKD_PORT
VOLUME $BEANSTALKD_DIR
#VOLUME /beanstalkd

CMD beanstalkd -b $BEANSTALKD_DIR -l $BEANSTALKD_ADDR -p $BEANSTALKD_PORT -z $BEANSTALKD_MAX_JOB_SIZE
