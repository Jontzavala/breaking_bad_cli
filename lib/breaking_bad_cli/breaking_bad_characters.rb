class Characters

    @@all = []

    attr_accessor :name, :occupation, :nickname, :portrayed

    #def initialize(name, occupation, nickname, portrayed)
       # @name = name
       # @occupation = occupation
        #@nickname = nickname
        #@portrayed = portrayed
        #save
    #end

    def initialize(character_hash)
        character_hash.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=")
        end
        save
    end
   
    def save
        @@all << self

    end

    def self.all
        @@all
    end

    def self.find_character(character_name)
        self.all.find do |character|
            character.name == character_name
        end
    end

end