get '/' do
  @success = false
  erb :index
end

get '/find' do
  if params[:pokemon] == ''
    @api = PokeApi::Search.new(random)
    @success = @api.success
  else
    @api = PokeApi::Search.new(params[:pokemon])
    @success = @api.success
  end

  erb :index
end

get '/find/random' do
    @api = PokeApi::Search.new(random)
    @success = @api.success
    erb :index
end

get '/shuffle/:text' do
  array = params[:text].split(' ')
  array.shuffle!.join(' ')
end

def random
      randemon = Pokemon.order("RANDOM()").first
      return randemon.pokemon
end
