class CreateTgtCookie < ActiveRecord::Migration[5.1]
  def change
    create_table :tgt_cookies do |t|
      t.string :cookie
      t.string :username

      t.timestamp :created_at
    end
  end
end
