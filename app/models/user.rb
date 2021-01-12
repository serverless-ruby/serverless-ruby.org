class User
  include Dynamoid::Document

  table name: :users, key: :github_uid, capacity_mode: :on_demand

  field :github_uid # primary key
  field :username
  field :avatar_url
  field :url
  field :sign_in_count, :integer

  has_many :posts

  def self.find_via_omniauth(github_uid)
    User.find(github_uid)
  end

  def self.create_with_omniauth(auth)
    user = User.new
    user.github_uid = auth["uid"]
    user.avatar_url = auth['extra']['raw_info']['avatar_url']
    user.username = auth['info']['nickname']
    user.url = auth['info']['urls']['GitHub']
    user.sign_in_count = 1
    user.save
    user
  end
end
