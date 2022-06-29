require_relative "board"
require_relative "human_player"
class Game
    def initialize(n)
        @board = Board.new(n)
        @player = HumanPlayer.new

    end

    def play
        while !@board.won?
            first_pos = @board.reveal_pos(@player.get_position)
            @board.render
            second_pos = @board.reveal_pos(@player.get_position)
            @board.render
            if first_pos == second_pos
            else 
                first_pos.hide
                second_pos.hide
                @board.render
            end 
        end 
    end 
                

    def game_over

    end

    

end