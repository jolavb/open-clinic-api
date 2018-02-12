class AddNameToUSponsors < ActiveRecord::Migration[5.1]
  def change
    add_column :u_sponsors, :name, :string
  end
end
