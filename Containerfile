# # build stage
FROM registry.access.redhat.com/ubi8/nodejs-16 as build-stage
# USER root
WORKDIR /usr/src/app
COPY --chown=1001:1001 package*.json ./
RUN npm ci
COPY --chown=1001:1001 tsconfig*.json ./
COPY --chown=1001:1001 webpack.prod.js ./
COPY --chown=1001:1001 webpack.common.js ./
COPY --chown=1001:1001 stylePaths.js ./
COPY --chown=1001:1001 src src
RUN npm run build
# RUN npm run build \
#  && chown -R 1001:1001 . \
#  && chmod -R 777 .

# production stage
FROM registry.access.redhat.com/ubi9/nodejs-20-minimal@sha256:7069dca0c923c6d1909ded070130320c13dee4cd51288ea0e8621b8807f3459d as production-stage
# USER 1001
WORKDIR /usr/src/app
COPY --chown=1001:1001 --from=build-stage /usr/src/app/package*.json/ .
# Copy in server.js from repo
COPY --chown=1001:1001 server.js .
RUN npm ci --omit=dev
COPY --chown=1001:1001 --from=build-stage /usr/src/app/dist/ dist/
ENV NODE_ENV=production
EXPOSE 9000
CMD [ "npm", "start" ]
