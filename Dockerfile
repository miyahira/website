FROM    centos


RUN     curl -sL https://rpm.nodesource.com/setup | bash -
RUN     yum install -y nodejs
RUN     yum install -y gcc ruby-devel make gem
RUN     gem install compass

COPY    . /src
RUN     cd /src; npm install
RUN     ./src/node_modules/wintersmith/bin/wintersmith build --chdir src

# EXPOSE    8080
# CMD     ["./src/node_modules/wintersmith/bin/wintersmith", "preview", "--chdir", "src"]
WORKDIR   ./src
EXPOSE 3333
CMD     ["node", "server.js"]

