USER root
RUN apk add --update --no-cache curl py-pip docker
RUN apk --no-cache add shadow && usermod -u 1001 jenkins
RUN groupmod -g 121 docker && usermod -aG docker jenkins
RUN pip install awscli
RUN  curl -LO https://dl.k8s.io/release/v1.20.0/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin
USER  jenkins

