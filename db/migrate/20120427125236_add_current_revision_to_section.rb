class AddCurrentRevisionToSection < ActiveRecord::Migration
  def change
    add_column :sections, :current_revision_id, :integer
  end
end
