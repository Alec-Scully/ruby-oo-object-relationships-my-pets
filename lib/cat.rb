class Cat
  # code goes here
  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"

    self.class.all << self
    #self == current cat
    #self.class == Cat (class)
    #self.class.all == Cat.all
  end

  def self.all #self.all == Cat.all
    @@all
  end

end