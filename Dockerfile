FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
    sudo \
    git \
    curl \
    wget \
    unzip \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://get.docker.com | sh
RUN usermod -aG docker jenkins

COPY script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

USER jenkins

RUN jenkins-plugin-cli --plugins \
    workflow-aggregator

EXPOSE 8080

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
