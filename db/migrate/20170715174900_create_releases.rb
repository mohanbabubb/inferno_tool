class CreateReleases < ActiveRecord::Migration[5.1]
  def change
    create_table :releases do |t|
      t.integer :r_id
      t.string :version
      t.string :release_type
      t.date :release_date
      t.string :release_notes_url
      t.string :availability
      t.integer :eula_id
      t.string :eula_slug
      t.string :eula_name
      t.string :eula_links_self
      t.integer :eccn
      t.string :license_exception
      t.date :updated_at
      t.date :software_files_updated_at
      t.string :links_self
      t.string :links_eula_acceptance
      t.string :links_product_files
      t.string :links_file_groups
      t.string :links_user_groups      

    t.timestamps
    end
  end
end
