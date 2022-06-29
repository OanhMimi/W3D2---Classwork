class HumanPlayer
    def get_position
        p "please enter the position of the card you'd like to flip (eg. 2 3)"
        position = gets.chomp.split(" ").map(&:to_i)
        return position
    end 
end 