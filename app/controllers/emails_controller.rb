class EmailsController < ApplicationController

before_action :authenticate_user!
before_action :find_email, only: [:show, :destroy]

  def index
    @emails = current_user.emails.order("created_at DESC")
  end

  def show
  end

  def new
    @email = Email.new
    @users = User.all
  end

  def create

    @user = current_user
    @users = User.all
    @emails = @users.map do |user|
      user.email
    end
    @email = @user.emails.new(params[:email].permit(:subject, :body))

    if @email.save
      MainMailer.news_email(@users, @email.subject, @email.body)
      @email.update(to: @emails)
      redirect_to user_emails_path(@user), notice: "Email successfully sent."
    else
      render 'new'
    end

  end

  def edit
  end

  def destroy
    if @email.destroy
      redirect_to user_emails_path(current_user)
    else
      render 'show'
    end
  end

  private

  def find_email
    @email = Email.find(params[:id])
  end

end
