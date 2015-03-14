class User < ActiveRecord::Base
  has_many :videos, dependent: :destroy

  validates_presence_of :name, :uid

  class << self
    def create_with_omniauth(auth)
      create! do |user|
        user.uid = auth['uid']
        user.name = auth['info']['name'] || '' if auth['info']
      end
    end
  end

  def generate_token!
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(64)
      break random_token unless User.exists?(token: random_token)
    end
    save!
  end

end
