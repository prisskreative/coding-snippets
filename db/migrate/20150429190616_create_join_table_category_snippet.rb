class CreateJoinTableCategorySnippet < ActiveRecord::Migration
  def change
    create_join_table :categories, :snippets do |t|
      # t.index [:category_id, :snippet_id]
      # t.index [:snippet_id, :category_id]
    end
  end
end
