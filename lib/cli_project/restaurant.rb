class Restaurant

    @@all = []

    attr_accessor :name, :address, :link

    def self.all
        @@all
    end

    def initialize
        @name = name
        @address = address
        @@all << self
    end

end