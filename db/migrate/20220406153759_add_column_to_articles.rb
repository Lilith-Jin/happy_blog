class AddColumnToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :status, :boolean, default: true
  end
end
