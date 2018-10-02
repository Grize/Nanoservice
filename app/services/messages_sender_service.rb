module MessagesSenderService
  class << self
    def send_one(message_params, messanger_params, token)
      create_message(message_params, messanger_params, token)
      send(@message[:id])
    end

    def send_many(messages_params, messangers_params, token)
      result = create_messages(messages_params, messangers_params, token)
      result.each { |message|  send(message[:id]) }
    end

    private

    def create_messages(messages_params, messangers_params, token)
      user = User.find_by(token: token)
      messages = messages_params.map { |message| Message.create(message) }
      user.messages << messages
      messangers = messangers_params.map { |messanger| Messanger.create(name: messanger) }
      if messangers.length == 1
        messages.each { |message| message.messangers << messangers[0] }
      else
        messangers.each { |messanger| messanger.messages << messages[0] }
      end
    end

    def create_message(message_params, messanger_params, token)
      user = User.find_by(token: token)
      @message = Message.create(message_params)
      user.messages << @message
      messanger = Messanger.create(name: messanger_params)
      @message.messangers << messanger
    end

    def send(message)
      SenderWorker.perform_async(message)
    end
  end
end
