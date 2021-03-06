class User
  include Dynamoid::Document
  include DudePolicy::IsADude   # this adds `user.dude`

  table name: :users, key: :github_uid, capacity_mode: :on_demand

  field :github_uid # primary key
  field :username
  field :avatar_url
  field :url

  has_many :posts

  def self.find_via_omniauth(github_uid)
    begin
      User.find(github_uid)
    rescue Dynamoid::Errors::RecordNotFound
    end
  end

  def self.create_with_omniauth(auth)
    user = User.new
    user.github_uid = auth["uid"]
    user.avatar_url = auth['extra']['raw_info']['avatar_url']
    user.username = auth['info']['nickname']
    user.url = auth['info']['urls']['GitHub']
    user.save
    user
  end

  def ==(other_user)
    other_user.is_a?(User)
    github_uid && github_uid == other_user.github_uid
  end
end
