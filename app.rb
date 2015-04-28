require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/tamagotchi")

get("/") do
  erb(:index)
end

post("/create") do
  name = params.fetch("name")
  my_pet = Tamagotchi.new(name)
  erb(:success)
end

post("/feed_me") do
  my_pet.feed_me()
  erb(:success)
end

post("/play_with_me") do
  my_pet.play_with_me()
  erb(:success)
end

post("/give_me_nap") do
  my_pet.give_me_nap()
  erb(:success)
end

post("/pass_time") do
  my_pet.pass_time()
  erb(:success)
end
