Rails.logger.info __FILE__

Tag.destroy_all

posts = Post.all
posts.each do |post|
  3.times do
    Tag.create!(
      post_id: post.id,
      name: Faker::Lorem.word
    )
  end
end
