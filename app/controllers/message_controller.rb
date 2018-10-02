class MessageController < ApplicationController
  include MessagesSenderService
  include AuthorizationService
  def send_one
    message = Message.new(message_params)
    messanger = Messanger.new(name: messanger_params)
    raise 'Invalid token' if !checking_for_token
    if message.valid? && messanger.valid?
      MessagesSenderService.send_one(message_params, messanger_params, params[:token])
    else
      raise 'Invalid params'
    end
  end

  def send_many
    messages = messages_params.map { |message| Message.new(message).valid? }
    messangers = messangers_params.map { |messanger| Messanger.new(name: messanger).valid? }
    raise 'Invalid token' if !checking_for_token
    if !messages.include?(false) && !messangers.include?(false)
      MessagesSenderService.send_many(messages_params, messangers_param, params[:token])
    else
      raise 'Invalid data'
    end
  end

  private

  def checking_for_token
    AuthorizationService.check_token(params[:token])
  end

  def messages_params
    addressees = params[:addressee].split(',')
    addressees.map do |name|
    {
      sender: params[:sender],
      addressee: name,
      body: params[:body],
      send_on: params[:send_on]
    }
    end
  end

  def messangers_params
    params[:messanger].split(',')
  end

  def message_params
    params.require(:message).permit(:sender,
                                    :addressee,
                                    :body,
                                    :send_on)
  end

  def messanger_params
    params[:messanger]
  end
end
