class API

    def self.get_data
        response = RestClient.get('https://breakingbadapi.com/api/characters')
        characters_array = JSON.parse(response)
        characters_array.each do |character|
            Characters.new(character)
        end

    end


end