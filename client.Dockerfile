FROM alpine:3

ENV FRP_VERSION=0.40.0
ENV FRP_URL=https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz
WORKDIR /opt/frp

ADD ${FRP_URL} /tmp/frp.tar.gz
RUN tar --strip 1 -xvzf /tmp/frp.tar.gz -C /opt/frp && rm /tmp/frp.tar.gz

ADD frpc.ini /opt/frp
ADD client-entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]