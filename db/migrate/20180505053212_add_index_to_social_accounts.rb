class AddIndexToSocialAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :social_accounts, :user_id, :integer
    add_index :social_accounts, :user_id
  end
end
