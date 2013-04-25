class ContactmailController < ApplicationController
  def create
     Pony.mail(:to => '*emailaddress*', :from => "#{email}", :subject => "art inquiry from #{firstname}", :body => "#{message}")
  end

  def new
@contactmail=[:firstname => "", :email => "", :message => ""]

  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy
  end
end
