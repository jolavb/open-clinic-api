class AddUSponsorToSponsor < ActiveRecord::Migration[5.1]
  def change
    add_column :sponsors, :u_sponsor_id, :integer
  end
end
