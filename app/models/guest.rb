class Guest < ActiveRecord::Base
  # extend FriendlyId
  # friendly_id :guest_name, use: :slugged
  include MailForm::Delivery
  attribute :guest_name,           :validate => true
  attribute :email,                   :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :number_of_guest,   :validate => true
  attribute :yes_no,   :validate => false
  attribute :no_yes,   :validate => false
  attribute :comments,   :validate => false
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "RSVP",
      :to => ['espinozab100@gmail.com', 'thanya.gaitan@gmail.com'],
      :from => %("#{guest_name}" <#{email}>)
    }
  end
end
