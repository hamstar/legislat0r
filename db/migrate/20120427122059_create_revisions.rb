class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.text :markup
      t.string :comment

      t.timestamps
    end
  end
end
