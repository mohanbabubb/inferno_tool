class CreateBuildpacks < ActiveRecord::Migration[5.1]
  def change
    create_table :buildpacks do |t|
      t.string :name
      t.string :version
      t.string :pack_type
      t.string :source
      t.string :github_link
      t.string :pivotal_link
      t.string :description
      t.integer :unique_id
	
      t.timestamps
    end
  end
end
