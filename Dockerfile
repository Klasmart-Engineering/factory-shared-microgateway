FROM golang:1.17-alpine AS builder

RUN apk add make gcc musl-dev

WORKDIR /tmp/builder
RUN mkdir plugins
COPY plugins plugins

WORKDIR /tmp/builder/plugins
RUN make all

FROM devopsfaith/krakend as krakend

ENV REGION="global"
ENV ENVIRONMENT="landing-zone"

USER root

RUN mkdir /etc/krakend/config
COPY config/ /etc/krakend/config/
COPY krakend.json /etc/krakend/krakend.json

ENV FC_ENABLE=1
ENV FC_SETTINGS=/etc/krakend/config/settings/${ENVIRONMENT}/${REGION}
ENV FC_PARTIALS=/etc/krakend/config/partials
ENV FC_TEMPLATES=/etc/krakend/config/templates

COPY --from=builder /tmp/builder/plugins/**/*.so /opt/krakend/plugins/
RUN chmod +x /opt/krakend/plugins/*.so

USER krakend
