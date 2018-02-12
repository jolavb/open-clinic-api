class CreateUSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :u_sponsors do |t|

      t.timestamps
    end
  end
end
