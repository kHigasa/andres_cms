Rails.logger.info __FILE__

PostItem.destroy_all

posts = Post.all
posts.each do |post|
  3.times do |i|
    i += 1
    PostItem.create!(
      post_id: post.id,
      sort_rank: i,
      image: File.open('./app/frontend/packs/images/steroidt_oc.png'),
      description: Faker::Lorem.sentence
    )
  end
end
