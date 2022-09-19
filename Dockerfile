FROM golang:1.19.1-alpine3.16 as builder

WORKDIR /usr/src/app

COPY . .

RUN go mod init fullcycle/desafio-01

RUN go mod download && go mod verify

RUN GOOS=linux go build desafio.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app .

CMD ["./desafio"]