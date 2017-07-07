class CreateServiceUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :service_urls do |t|
      t.references :service, index: true
      t.string :url

      t.timestamps
    end
  end
end
