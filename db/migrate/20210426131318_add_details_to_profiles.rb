class AddDetailsToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :country, :string
    add_column :profiles, :state, :string
    add_column :profiles, :city, :string
  end
end
