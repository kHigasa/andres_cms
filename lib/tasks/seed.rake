desc 'Throw data into production env'
task 'db:seed:production' => :environment do
  load Rails.root.join('db', 'production_sd.rb')
end
