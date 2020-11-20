require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species, :say_species

  @@all = []
  @@count = 0
  
  def initialize(name)
    @name = name  
    @species = "human"
    @say_species = "I am a human."

    self.class.all << self
    @@count += 1 #not needed if you do the commented out code below
  end 

  def self.all
    @@all
  end

  def self.count
    @@count
    # @@all.length #Avelon's optional code
  end

  def self.reset_all
    self.all.clear
    @@count = 0
    # @@all.clear #Avelon's optional code
  end

  def cats
    my_cats = Cat.all.select do | cat |
      cat.owner == self
    end
  end

  def dogs
    my_dogs = Dog.all.select do | dog |
      dog.owner == self
    end
  end

  def buy_cat(name)
    name = Cat.new(name, self)
  end

  def buy_dog(name)
    name = Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do | dog |
      dog.mood = "happy"
    end
    # self.dogs
    # binding.pry
  end

  def feed_cats
    self.cats.each do | cat |
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do | cat |
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.dogs.each do | dog |
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end

# alec = Owner.new("Alec")
# avelon = Owner.new("Avelon")

# binding.pry
# 0