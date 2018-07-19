Rails.logger.info __FILE__

Supporter.destroy_all
20.times do |i|
  i += 1
  type = if (i % 3).zero?
           :kouenn
         elsif (i % 7).zero?
           :josei
         else
           :kyousann
         end
  image = if (i % 2).zero?
            File.open('./app/frontend/packs/images/bouncer_oc.png')
          else
            File.open('./app/frontend/packs/images/spider_oc.jpg')
          end
  Supporter.create!(
    type: type,
    sort_rank: i,
    image: image
  )
end
