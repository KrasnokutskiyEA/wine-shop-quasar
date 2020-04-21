FROM node:12.16

RUN mkdir -p /usr/src/app/

WORKDIR /usr/src/app/
COPY . /usr/src/app/

# building project 
RUN npm i -g @vue/cli && npm i -g @quasar/cli
RUN npm install
RUN quasar build -m ssr

EXPOSE 3000

WORKDIR /usr/src/app/dist/ssr
CMD ["node", "index.js"]