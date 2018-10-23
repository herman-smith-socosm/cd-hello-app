FROM iron/go:dev
ENV SRC_DIR=/go/src/github.com/source-code-smith/cd-hello-app

COPY main.go $SRC_DIR/
RUN cd $SRC_DIR; go install -v

EXPOSE 8888

ENTRYPOINT ["cd-hello-app"]
CMD ["start"]
