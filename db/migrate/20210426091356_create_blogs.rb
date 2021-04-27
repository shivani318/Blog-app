class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :name
      t.text :description
      t.date :launch_date

      t.timestamps
    end
  end
end
