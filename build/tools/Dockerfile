FROM golang:1.22

ENV TZ=Asia/Tokyo

COPY ./zscaler.crt /usr/local/share/ca-certificates/extra/zscaler.crt
RUN update-ca-certificates

RUN apt-get update && apt-get install -y nodejs npm

RUN go install github.com/mikefarah/yq/v4@latest
RUN go install github.com/deepmap/oapi-codegen/v2/cmd/oapi-codegen@v2.1.0
RUN npm install -g @apidevtools/swagger-cli