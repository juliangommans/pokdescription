module PokeApi

  class Search
    include HTTParty

    attr_reader :success, :sprite_img, :name, :ordered_hash, :top

    def initialize(name)
      @name = name.downcase
      @success = false
      find_pokemon
    end

    def find_pokemon
      pokemon = Pokemon.find_by(pokemon: @name)
        if pokemon
          @success = true
            find_descriptions(pokemon)
        end
    end

    def find_descriptions(poke)
      description_array = []
      @link = HTTParty.get(poke.url)
      find_sprite
      result = @link["descriptions"]
      result.each do |desc|
        description_array << (HTTParty.get("http://pokeapi.co/#{desc["resource_uri"]}"))["description"]
      end
      description_word_tally(description_array)
    end

    def description_word_tally(data)
      data_string = data.join(' ')
      data_array = data_string.downcase.gsub(/[^a-z0-9\s]/, '').split(' ')
      word_hash = data_array.uniq.map {|word| [word, data_array.count(word)]}.to_h
      word_hash.delete_if{ |k,v| k.length < 4 }
      @ordered_hash = word_hash.sort_by{ |k,v| v}.reverse
      top_ten
    end

    def top_ten
      @top = []
      hash_grab = Hash[@ordered_hash.sort_by{ |k,v| v}.reverse[0..9]]
      hash_grab.each do |k,v|
        @top << k
      end
    end

    def find_sprite
      sprite = @link["sprites"][0]["resource_uri"]
      sprite_api = HTTParty.get("http://pokeapi.co/#{sprite}")
      @sprite_img = "http://pokeapi.co#{sprite_api["image"]}"
    end

    # def random_pokemon
    #   randemon = Pokemon.order("RANDOM()").first
    #   @success = true
    #   @name = randemon.pokemon
    #   find_descriptions(randemon)
    # end

  end

end
