class Message < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :weddingdate, :validate =>true
  attribute :location,  :validate =>true
  attribute :guesscount, :validate =>true
  attribute :coveragetype, :validate =>true
  attribute :question,  :validate =>true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => %("#{name}"),
      :to => "hdtran89@yahoo.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end