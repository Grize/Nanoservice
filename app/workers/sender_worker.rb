class SenderWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'default'
  def perform(message)
    @message = Message.find(message)
    if @message.send_on == nil
      @message.update(sent: true)
      puts 'Message sended'
    else
      puts "Message didn't send"
      SenderWorker.perform_in(5, message)
    end
  end
end
