class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :job_title
      t.string :company
      t.string :location
      t.string :your_name
      t.integer :phone

      t.timestamps null: false
    end
  end
end
