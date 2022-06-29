require_relative "card"
require_relative "game"


class Board 

    attr_reader :grid
    def initialize(n)
        @grid = Array.new(n) {Array.new(n," ")}
        @deck_size = n * n
        @deck = []
        populate

    end

    def populate 
        array = self.generate_card
        @grid.each.with_index do |row, idx1|
            @grid.each.with_index do |col, idx2|
                @grid[idx1][idx2] = Card.new(array.pop)
            end 
        end 
    end

    def generate_card
        alpha_arr = ("A".."Z").to_a
        until @deck.length == @deck_size
            card_value = alpha_arr.pop
            @deck << card_value << card_value
        end
        @deck.shuffle 
    end 

            
    def render # print card.to_s value, if revealed, return face value, if hidden return "?"
        # self.reveal_pos(position)
        (0...@grid.length).each {|i| print " #{i} "}
        puts
        @grid.each_with_index do |row,idx1|
                print idx1
                row.each_with_index {|col,i| print " #{col.card_face} "}
                puts        
        end
    end



    def won?
        @grid.all? do |subarray|
            subarray.all? do |ele|
                ele.face_up == true 
            end 
        end 
    end

    def reveal_pos(position)
        if @grid[position[0]][position[1]].face_up == false
            @grid[position[0]][position[1]].reveal 
        end 
        @grid[position[0]][position[1]]
    end 
end