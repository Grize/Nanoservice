# README

Запуск сервиса происходит по командам:

* be rails s

* be sidekiq

Запросы передаются на http://localhost:3000/message/send_one и http://localhost:3000/message/send_many

* /send_one служит для отправки сообщения одному получателю на один мессенджер

* /send_many для отправки сообщения или нескольким пользователям или на несколько мессенджеров

* запросы передаются в формате:
  curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"token":"user token","sender":"Sender name", "addressee":"Addressee name","body":"Message body","messanger":"messanger"}' \
  http://localhost:3000/message/send_one

* Для верефикации нужен запись юзера в базе данных, в которой будет токен

* Для очередей был использован sidekiq как один из самых подходящих гемов реализации

* К сожалению, не были реализованны отправка сообщений по расписанию и исключение возможности отправки одного сообщения несколько раз. 
