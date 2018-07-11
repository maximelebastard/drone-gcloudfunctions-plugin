FROM google/cloud-sdk:latest

RUN mkdir -p /bin/plugin/ /app

ADD scripts/run.sh /bin/plugin/run.sh
ADD scripts/auth.sh /bin/plugin/auth.sh
RUN chmod +x /bin/plugin/*

WORKDIR /app

ENTRYPOINT /bin/plugin/run.sh