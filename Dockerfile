# building project 
FROM node:12.16-alpine As builder

RUN mkdir -p /usr/src/app/

WORKDIR /usr/src/app/
COPY . /usr/src/app/

RUN npm i -g @vue/cli && npm i -g @quasar/cli
RUN npm i
RUN quasar build -m ssr

# final result
FROM node:12.16-alpine

WORKDIR /app
COPY --from=builder /usr/src/app/dist/ssr/ /app/
RUN npm i

EXPOSE 3000

CMD ["node", "index.js"]