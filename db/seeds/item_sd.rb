Rails.logger.info __FILE__

Item.destroy_all

posts = Post.all
posts.each do |post|
  Item.create!(
    sort_rank: 1,
    post_id: post.id,
    target: ItemText.find(2 * post.id - 1)
  )
  Item.create!(
    sort_rank: 2,
    post_id: post.id,
    target: ItemImage.find(post.id)
  )
  Item.create!(
    sort_rank: 3,
    post_id: post.id,
    target: ItemText.find(2 * post.id)
  )
end
