FROM amazon/dynamodb-local:latest AS datastore
EXPOSE 8000

FROM python:3.8.0b4-alpine3.10 as awscli

# Versions: https://pypi.python.org/pypi/awscli#downloads
ENV AWS_CLI_VERSION 1.16.233

RUN apk --no-cache update && \
    apk --no-cache add ca-certificates groff less && \
    pip3 --no-cache-dir install awscli==${AWS_CLI_VERSION} && \
    rm -rf /var/cache/apk/*

WORKDIR /Scripts
COPY ["Schema/CreateProductCatalogTable.json", "/"]
COPY ["testing/ProductCatalog.json", "/"]

RUN aws dynamodb create-table --endpoint-url http://localhost:8000 --cli-input-json file://CreateProductCatalogTable.json
RUN aws dynamodb batch-write-item --endpoint-url http://localhost:8000 --request-items file://ProductCatalog.json


