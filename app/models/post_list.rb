class PostList
  include Dynamoid::Document

  table name: :post_lists, capacity_mode: :on_demand
  field :published, :serialized, default: {}

  # Note I'm only creating one record of such kind and always query the same items in one table row

  def self.add!(post)
    PostList.first._add_to_published!(post)
  end

  def self.remove!(post)
    PostList.first._remove_from_published!(post)
  end

  def self.__reset_db!
    puts "this will erase DB table entry are you sure ??"
    sleep(3) # time out to realize how stupid you are when triggred accidentially in console
    pl = PostList.first
    pl.published = {}
    pl.save!
  end

  def self.latest_posts
    PostList.first.latest_posts
  end

  def _add_to_published!(post)
    raise "'#{post || 'Nil'}' should be a Post" unless post.is_a?(Post)
    raise "#{post.public_uid} already in the list" if published[post.public_uid]
    self.published[post.public_uid] = post.published_at.to_i
    self.save!
  end

  def _remove_from_published(post)
    raise "#{post.public_uid} is not in the list" unless published[post.public_uid]
    self.published.delete(post.public_uid)
    self.save!
  end

  def latest_posts
    latest_uids = published
      .sort_by { |public_uid, sortkey| sortkey }
      .reverse
      .map { |public_uid, sortkey| public_uid }

    published_posts = Post.find(latest_uids.first(20))
    published_posts.sort_by(&:published_at).reverse
  end
end
