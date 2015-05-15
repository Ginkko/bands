class InitializeDatabase < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.column :name, :string
    end
    create_table :venues do |t|
      t.column :name, :string
    end
    create_table :bands_venues, id: false do |t|
      t.integer :band_id
      t.integer :venue_id
    end
    add_index :bands_venues, :band_id
    add_index :bands_venues, :venue_id
  end
end
