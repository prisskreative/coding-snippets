class Addcategoryidtosnippets < ActiveRecord::Migration
  def change
  	add_reference :snippets, :category, index: true
  end
end
