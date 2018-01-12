class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.string :text
      t.string :nct_id
      t.timestamps
    end
  end
end
