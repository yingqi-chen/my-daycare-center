class CreateCenters < ActiveRecord::Migration
  def change
    create_table :centers do |t|

      t.timestamps null: false
    end
  end
end
