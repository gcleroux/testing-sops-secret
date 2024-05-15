FROM golang:1.20-alpine AS builder

LABEL org.opencontainers.image.source=https://github.com/gcleroux/testing-sops-secret
LABEL org.opencontainers.image.description="secret-hello"

WORKDIR /app

COPY go.mod main.go ./

RUN CGO_ENABLED=0 go build -o hello

FROM gcr.io/distroless/static-debian12:nonroot-amd64

COPY --from=builder /app/hello /hello

EXPOSE 8080

CMD [ "/hello" ]
