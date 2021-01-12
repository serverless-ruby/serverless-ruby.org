class Post
  include Dynamoid::Document
  include DudePolicy::HasPolicy  # this adds post.policy

  table name: :posts, key: :public_uid, capacity_mode: :on_demand

  field :public_uid
  field :title
  field :description
  field :karma, :integer
  field :published_at, :datetime, default: -> { Time.now }, store_as_string: true

  belongs_to :user

  before_create :generate_public_uid

  validates_presence_of :title
  #validates_presence_of :description

  def to_param
    public_uid
  end

  def inspect
    "<Post '#{public_uid}' title: '#{title}'>"
  end

  private
    def generate_public_uid
      self.public_uid = SecureRandom.hex(4)
    end

    def set_default_karma
      self.karma = 1 unless karma
    end
end
