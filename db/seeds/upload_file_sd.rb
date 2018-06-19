Rails.logger.info __FILE__

UploadFile.destroy_all
histories = History.all
histories.each do |history|
  2.times do
    UploadFile.create(
      history_id: history.id,
      name: Faker::Kpop.girl_groups,
      file: File.open('./resources/files/charytanowicz.pdf')
    )
  end
end
