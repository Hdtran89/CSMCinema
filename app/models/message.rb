class Message
  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :weddingdate, :location, :guesscount, :package, :question

  validates :name,
    presence: true
  validates :email,
    presence: true
  validates :location,
    presence: true
  validates :weddingdate,
    presence: true
  validates :guesscount,
    presence: true
  validates :package,
    presence: true
  validates :question,
    presence: true
end