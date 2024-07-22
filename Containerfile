# # build stage
# FROM node:lts-alpine as build-stage
# USER root
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY ./ .
# RUN npm run build \
#  && chown -R 1001:1001 . \
#  && chmod -R 777 .

# production stage
FROM nginxinc/nginx-unprivileged:stable-alpine as production-stage
USER 1001
# COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY /dist /usr/share/nginx/html
EXPOSE 8070