class Contact < MailForm::Base
  attribute :name,        :validate => true
  attribute :email,       :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :weddingdate, :validate => false
  attribute :location,    :validate => false
  attribute :guesscount,  :validate => false
  attribute :package,     :validate => true
  attribute :question


  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Message from: #{name}",
      :to => "hdtran89@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end