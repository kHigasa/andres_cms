class CreateSocialAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :social_accounts do |t|
      t.integer :account_type
      t.string :url

      t.timestamps
    end
  end
end
