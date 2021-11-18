FROM dtzar/helm-kubectl:3.2.0

WORKDIR /app
RUN apk add docker

COPY run.sh .

ENTRYPOINT [ "/app/run.sh" ]

