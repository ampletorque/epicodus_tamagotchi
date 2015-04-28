require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/tamagotchi")

get("/") do
  if Tamagotchi.exists() == true
    @name = Tamagotchi.all()[0]
    @food_level = Tamagotchi.all()[1]
    @activity_level = Tamagotchi.all()[3]
    @sleep_level = Tamagotchi.all()[2]
    erb(:index)
  else
    erb(:tocreate)
  end
end

post("/create") do
  name = params.fetch("name")
  @@my_pet = Tamagotchi.new(name)
  @name = Tamagotchi.all()[0]
  erb(:success)
end

post("/feed_me") do
  @@my_pet.feed_me()
  @name = Tamagotchi.all()[0]
  erb(:success)
end

post("/play_with_me") do
  @@my_pet.play_with_me()
  @name = Tamagotchi.all()[0]
  erb(:success)
end

post("/give_me_nap") do
  @@my_pet.give_nap()
  @name = Tamagotchi.all()[0]
  erb(:success)
end

post("/pass_time") do
  @@my_pet.time_passes()
  @name = Tamagotchi.all()[0]
  erb(:success)
end
