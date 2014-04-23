class ChangeBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :top_words, :string
    add_column :blogs, :dates, :string
  end
end
