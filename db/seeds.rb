require "HTTParty"

Pokemon.destroy_all

@data = HTTParty.get("http://pokeapi.co/api/v1/pokedex/1")
@poke_array = @data["pokemon"]

@poke_array.length.times do
  poke = @poke_array.shift
  unless poke["name"].match(/-/)
  Pokemon.create(pokemon: poke["name"], url: "http://pokeapi.co/" + poke["resource_uri"])
  end
end
