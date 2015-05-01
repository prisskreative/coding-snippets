class CreateJoinTableSnippetUser < ActiveRecord::Migration
  def change
    create_join_table :snippets, :users do |t|
      # t.index [:snippet_id, :user_id]
      # t.index [:user_id, :snippet_id]
    end
  end
end
