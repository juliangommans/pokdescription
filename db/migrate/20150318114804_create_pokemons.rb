class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :pokemon
      t.string :url
      t.timestamps
    end
  end
end
