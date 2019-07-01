class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.2]
  def change

    create_table :users do |t|
      ## Required
      t.string :provider, null: false, default: "email"
      t.string :uid, null: false, default: ""

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## User Info
      t.string :username, null: false
      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
