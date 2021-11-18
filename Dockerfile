FROM dtzar/helm-kubectl:3.2.0

RUN apk add docker

WORKDIR /app

COPY run.sh .
RUN chmod +x run.sh
ENTRYPOINT [ "/app/run.sh" ]

