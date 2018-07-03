# User
load Rails.root.join('db', 'seeds', 'user_sd.rb')
# SocialAccount
load Rails.root.join('db', 'seeds', 'social_account_sd.rb')
# AboutItem
load Rails.root.join('db', 'seeds', 'about_item_sd.rb')
# Post
load Rails.root.join('db', 'seeds', 'post_sd.rb')
# Tag
load Rails.root.join('db', 'seeds', 'tag_sd.rb')
# ItemText
load Rails.root.join('db', 'seeds', 'item_text_sd.rb')
# ItemImage
load Rails.root.join('db', 'seeds', 'item_image_sd.rb')
# Item
load Rails.root.join('db', 'seeds', 'item_sd.rb')
# History
load Rails.root.join('db', 'seeds', 'history_sd.rb')
# Activity
load Rails.root.join('db', 'seeds', 'activity_sd.rb')
# UploadFile
load Rails.root.join('db', 'seeds', 'upload_file_sd.rb')
# Supporter
load Rails.root.join('db', 'seeds', 'supporter_sd.rb')
# FaqCategory
load Rails.root.join('db', 'seeds', 'faq_category_sd.rb')
# Question
load Rails.root.join('db', 'seeds', 'question_sd.rb')

Rails.logger.info 'Creating seeds data has completed!!'
