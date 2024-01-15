FROM golang:1.21-alpine3.19 AS builder 

COPY . /telegram_bot_kucher
WORKDIR /telegram_bot_kucher


RUN go mod download 
RUN go build -o ./bin/bot cmd/bot/main.go 

FROM alpine:latest 

WORKDIR /root/

COPY  --from=0 /telegram_bot_kucher/bin/bot .
COPY  --from=0 /telegram_bot_kucher/configs configs/

EXPOSE 8080

CMD ["./bot"]