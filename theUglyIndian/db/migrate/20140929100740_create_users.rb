class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :name
      t.string :oauth_token
      t.string :email
      t.binary :image
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
