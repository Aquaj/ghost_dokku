FROM ghost:latest

RUN npm install deepmerge --silent

COPY deepmerge.js deepmerge.js
COPY config.json config.override.json
RUN mv config.production.json config.original.json
RUN node deepmerge.js ./config.original.json ./config.override.json config.production.json
RUN chown -R node config.production.json
