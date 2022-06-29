class Card 
    attr_reader :face_up, :card_value, :card_face

    def initialize(card_value)
        @card_value = card_value
        @face_up = false 
        @card_face = "?"
    end 

    def hide 
        @face_up = false 
        @card_face = "?"

    end 

    def reveal
        @face_up = true
        @card_face = @card_value
    end 



    def ==(other)
        self.card_value == other.card_value
    end 
end 