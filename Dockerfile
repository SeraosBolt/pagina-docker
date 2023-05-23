# syntax=docker/dockerfile:1.4

FROM --platform=$BUILDPLATFORM node:17.0.1-bullseye-slim as builder

ARG PORT=8080

RUN mkdir /project

WORKDIR /project

RUN npm install -g @angular/cli@13

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

ENV PORT=$PORT

ENTRYPOINT npm start

EXPOSE $PORT