class User
  include Dynamoid::Document

  field :uid
  field :provider
  field :nickname
  field :avatar_url
  field :url
  field :sign_in_count, :integer

 def self.create_with_omniauth(auth)
    User.new.tap do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.avatar_url = auth['extra']['raw_info']['avatar_url']
      user.username = auth['info']['nickname']
      user.url = auth['info']['urls']['GitHub']
      user.sign_in_count = 1
      user.save!
    end
  end
end
