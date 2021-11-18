FROM dtzar/helm-kubectl:3.2.0

RUN apk add docker
RUN apk add --update --no-cache --virtual .build-deps curl openssl \
    && curl -s -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator \
    && chmod +x /usr/local/bin/aws-iam-authenticator \
    && curl -s -o /tmp/aws-iam-authenticator.sha256 https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator.sha256 \
    && openssl sha1 -sha256 /usr/local/bin/aws-iam-authenticator \
    && apk del .build-deps
RUN apk add --update \
        coreutils \
        py-pip
RUN pip install awscli

WORKDIR /app

COPY run.sh .
RUN chmod +x run.sh
ENTRYPOINT [ "/app/run.sh" ]

