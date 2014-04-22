class CreateBlog < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :url
      t.string :x_over_time
      t.string :y_over_time
      t.timestamps
    end
  end
end
