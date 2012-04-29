class AddRevisionIdToSection < ActiveRecord::Migration
  def change
    add_column :sections, :revision_id, :integer
  end
end
