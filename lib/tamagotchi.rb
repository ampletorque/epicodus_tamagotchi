class Tamagotchi

  @@tamagotchis = []
  @@exists = [false]

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @is_alive = true
    @timer = Time.new().to_i
    @@tamagotchis = [ @name, @food_level, @sleep_level, @activity_level, @is_alive, @timer ]
    @@exists = true
    @ageapplied = 0
  end

  define_singleton_method(:all) do
    @@tamagotchis
  end

  define_singleton_method(:exists) do
    @@exists
  end

  define_method(:auto_time) do
    current_time = Time.new().to_i
    time_diff =  current_time - @timer
    age = time_diff./(1).floor()
    if age > @ageapplied
      age.-(@ageapplied).times do
        time_passes
        @ageapplied = @ageapplied + 1
      end
    end
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:sleep_level) do
    @sleep_level
  end

  define_method(:activity_level) do
    @activity_level
  end

  define_method(:health_stats) do
    [ @food_level, @sleep_level, @activity_level, @is_alive ]
  end

  define_method(:is_alive) do
    @is_alive
  end

  define_method(:set_food_level) do |level|
    @food_level = level
    @@tamagotchis[1] = @food_level
    check_health
  end

  define_singleton_method(:regenerate) do
    @@exists = false
    #@@tamagotchis[5] = true
  end

  define_method(:check_health) do
    if (@food_level == 0) || (@sleep_level == 0) || (@activity_level == 0)
      @is_alive = false
      @@tamagotchis[4] = false
    else
      @is_alive = true
      @@tamagotchis[4] = true
    end
  end

  define_method(:feed_me) do
    @food_level = @food_level + 1
    @@tamagotchis[1] = @food_level
  end

  define_method(:play_with_me) do
    @activity_level = @activity_level + 1
    @@tamagotchis[3] = @activity_level
  end

  define_method(:give_nap) do
    @sleep_level = @sleep_level + 1
    @@tamagotchis[2] = @sleep_level
  end

  define_method(:time_passes) do
    @sleep_level = @sleep_level - 1
    @@tamagotchis[2] = @sleep_level
    @food_level = @food_level - 1
    @@tamagotchis[1] = @food_level
    @activity_level = @activity_level - 1
    @@tamagotchis[3] = @activity_level
    check_health
  end

end
