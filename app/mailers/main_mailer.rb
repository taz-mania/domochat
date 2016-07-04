class MainMailer < ApplicationMailer
  default from: ENV["YANDEX_USER"]

  def news_email(users, subject, message)

    # @mailgun = Mailgun(:api_key => ENV['MAILGUN_API'])

    if users.kind_of?(Array)
      @users = users
      @emails = users.map do |user|
        user.email
      end
    else
      @emails = [users.email]
    end

    @message = message
    @subject = subject

    puts @emails, @subject, @message

    # Line for regular email client:
    mail(to: @emails, subject: @subject).deliver_now

    # Using Mailgun:
    # parameters = {
    #   :to => @emails,
    #   :subject => @subject,
    #   :text => @message,
    #   :from => ENV['GMAIL_USER']
    # }
    # @mailgun.messages.send_email(parameters)

  end
end
