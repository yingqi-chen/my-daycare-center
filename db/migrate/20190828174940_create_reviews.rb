class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.float :rate
      t.string :content
      t.integer :user_id
      t.integer :center_id
      t.timestamps null: false
    end
  end
end
