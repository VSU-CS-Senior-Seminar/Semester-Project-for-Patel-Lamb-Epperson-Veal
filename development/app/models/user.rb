class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :neighborhood
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  def forem_name
      nickname
  end
  acts_as_messageable

  def mailboxer_name
    self.fname
  end

  def mailboxer_email(object)
    self.email
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved? 
      :not_approved
    else
      super # Use whatever other message
    end
  end
end
