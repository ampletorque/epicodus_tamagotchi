class Tamagotchi

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @is_alive = true
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
    check_health
  end

  define_method(:check_health) do
    if (@food_level == 0) || (@sleep_level == 0) || (@activity_level == 0)
      @is_alive = false
    else
      @is_alive = true
    end
  end

  define_method(:feed_me) do
    @food_level = @food_level + 1
  end

  define_method(:play_with_me) do
    @activity_level = @activity_level + 1
  end

  define_method(:give_nap) do
    @sleep_level = @sleep_level + 1
  end

  define_method(:time_passes) do
    @sleep_level = @sleep_level - 1
    @food_level = @food_level - 1
    @activity_level = @activity_level - 1
    check_health
  end

end
