class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :flats
  has_many :owner_chatrooms, class_name: 'Chatroom', :foreign_key => 'owner_id'
  has_many :client_chatrooms, class_name: 'Chatroom', :foreign_key => 'client_id'
  # after_save :send_mail

  private

  def send_mail
    MailJob.perform_later
    UserMailer.welcome_email(self).deliver_now
  end

end
