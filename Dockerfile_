FROM alpine:3.5
MAINTAINER Edward.Yang <edward.yang@goiot.net>

## Add Tini and Beanstalkd
ADD app_alpine /bin/app
#RUN mkdir /data
#RUN apk add --update --no-cache tini beanstalkd && rm -fr /var/cache/apk/*
#ENTRYPOINT ["/sbin/tini", "--"]

## Expose the port
EXPOSE 11300
#VOLUME /data

CMD ["app", "-p", "11300","-u", "nobody"]
