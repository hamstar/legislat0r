class AddBillIdToSections < ActiveRecord::Migration
  def change
    add_column :sections, :bill_id, :integer
  end
end
