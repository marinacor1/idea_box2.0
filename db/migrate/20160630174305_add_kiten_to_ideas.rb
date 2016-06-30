class AddKitenToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :kitten, :string
  end
end
