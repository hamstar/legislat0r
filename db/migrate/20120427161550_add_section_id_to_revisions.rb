class AddSectionIdToRevisions < ActiveRecord::Migration
  def change
    add_column :revisions, :section_id, :integer
  end
end
