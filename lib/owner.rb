require 'pry'

class Owner

  attr_reader :species
  attr_accessor :name, :pets

  ALL = []

  def initialize(name)
    @name = name
    @pets = {fishes: [], cats: [], dogs: []}
    @species = "human"
    ALL << self
  end

  def self.all
    ALL
  end

  def self.reset_all
    ALL.clear
  end

  def self.count
    ALL.count
  end

  def say_species
    "I am a human."
  end

  def buy_fish(fish)
    self.pets[:fishes] << Fish.new(fish)
  end

  def buy_cat(cat)
    self.pets[:cats] << Cat.new(cat)
  end

  def buy_dog(dog)
    self.pets[:dogs] << Dog.new(dog)
  end

  def walk_dogs
    @pets[:dogs].each { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = "happy" }
  end

  def feed_fish
    @pets[:fishes].each { |fish| fish.mood = "happy" }
  end

  def sell_pets
    @pets.each do |type, array|
      array.each do |pet|
        pet.mood = "nervous"
      end
      array.clear
    end
  end

  def list_pets
    @pets.each do |type, array|
      if type == :fishes
        @fish_count = array.count
      elsif type == :dogs
        @dog_count = array.count
      else
        @cat_count = array.count
      end
    end
    "I have #{@fish_count} fish, #{@dog_count} dog(s), and #{@cat_count} cat(s)."
  end

end
