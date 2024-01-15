.PHONY: 
.SILENT:

build:
	go build -o ./.bin/bot cmd/bot/main.go

run: build
	./.bin/bot

build-image:
	docker build  -t telegram-bot . 

start-container: 
	docker run --name telegram-bot-kucher -p 8080:8080 --env-file /home/yaroslav/go/src/telegram_bot_kucher/.env telegram-bot 