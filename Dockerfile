FROM ghost:latest

COPY config.js config.production.js
RUN chown -R node config.production.js
