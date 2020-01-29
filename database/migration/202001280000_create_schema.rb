class CreateSchema < ActiveRecord::Migration[6.0]
  def change
    # users
    create_table :users, id: :integer, unsigned: true do |t|
      t.string :name, null: false
      t.string :email
      t.string :slack_id
      t.string :access_token
      t.integer :taco_count, default: 0
      t.column :created_at, 'DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP'
      t.column :updated_at, 'DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    end

    # tacos
    create_table :tacos do |t|
      t.unsigned_integer :user_id, index: true
      t.unsigned_integer :give_user_id, index: true
      t.integer :quantity, limit: 1
      t.column :created_at, 'DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP'
    end

    # 外部制約
    add_foreign_key :tacos, :users, column: :user_id, name: 'fk_tacos_user_id'
    add_foreign_key :tacos, :users, column: :give_user_id, name: 'fk_tacos_give_user_id'
  end
end
