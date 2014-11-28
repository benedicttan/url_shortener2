class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :email, :password
      t.timestamps
    end

    create_table :urls do |t|
      t.belongs_to :user
      t.string :short_url, :long_url
      t.integer :click_count
      t.timestamps
    end

  end
end