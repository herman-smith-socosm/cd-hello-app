FROM golang:1.10
WORKDIR /go/src/hello-app
COPY . .
RUN go install -v
CMD ["app"]
