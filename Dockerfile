FROM dtzar/helm-kubectl:3.2.0

RUN apk add docker
RUN curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator \
    chmod +x ./aws-iam-authenticator \
    mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin \
    echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc


WORKDIR /app

COPY run.sh .
RUN chmod +x run.sh
ENTRYPOINT [ "/app/run.sh" ]

