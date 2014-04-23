class CreateBlog < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :url
      t.text :x_over_time
      t.text :y_over_time
      t.timestamps
    end
  end
end
