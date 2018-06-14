# User
load Rails.root.join('db', 'seeds', 'user_sd.rb')
# AboutItem
load Rails.root.join('db', 'seeds', 'about_item_sd.rb')
# Post
load Rails.root.join('db', 'seeds', 'post_sd.rb')

Rails.logger.info 'Creating seeds data has completed!!'
