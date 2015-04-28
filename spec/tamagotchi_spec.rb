require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  describe("#initialize") do
    it("sets the name and life levels of a new Tamagotchi") do
      my_pet = Tamagotchi.new("Seymour")
      expect(my_pet.name()).to(eq("Seymour"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.activity_level()).to(eq(10))
      expect(my_pet.health_stats()).to(eq([10, 10, 10, true]))
      expect(my_pet.is_alive()).to(eq(true))
    end
  end

  describe("#time_passes") do
    it("decreases the amount of food the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.time_passes()
      expect(my_pet.food_level()).to(eq(9))
    end
  end

  describe("#is_alive") do
    it("is alive if the food level is above 0") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.is_alive()).to(eq(true))
    end

    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_food_level(0)
    # my_pet.check_health()
      expect(my_pet.is_alive()).to(eq(false))
    end
  end

  describe("time passing") do
    it("loses stats if time passes") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.time_passes()
      expect(my_pet.health_stats()).to(eq([9, 9, 9, true]))
    end
  end

  describe("caring for tamagotchi") do
    it("gains stats if tamagotchi is cared for") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.time_passes()
      my_pet.feed_me()
      my_pet.play_with_me()
      my_pet.give_nap()
      expect(my_pet.health_stats()).to(eq([10, 10, 10, true]))
    end
  end
  
end
