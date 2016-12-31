class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.integer :price
      t.text :wine_desc
      t.string :wine_color
      t.integer :hyouka
      t.integer :wine_aut
      t.string :country
      t.string :shop
      t.string :hinsyu
      t.string :sanchi
      t.string :smell
      t.string :taste
      t.string :company
      t.integer :kazu
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
