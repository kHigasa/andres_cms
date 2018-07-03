Rails.logger.info __FILE__

ItemImage.destroy_all

50.times do
  ItemImage.create!(
    caption: Faker::FunnyName.name,
    image: File.open('./app/frontend/packs/images/steroidt_oc.png')
  )
end
