class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.text :description
      t.string :short_url
      t.string :tags

      t.timestamps null: false
    end
  end
end
