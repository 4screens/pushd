FROM node:0.10-slim

RUN DEBIAN_FRONTEND=noninteractive && \
 apt-get update && \
 apt-get install build-essential git python-antlr --no-install-recommends -y && \
 apt-get clean -y && \
 apt-get autoremove -y && \
 rm -rf /var/lib/apt/lists/*

WORKDIR /pushd

ADD package.json /pushd/package.json

RUN npm install --production

ADD . /pushd

ENTRYPOINT ["/pushd/entrypoint.sh"]
CMD ["node", "server.js"]