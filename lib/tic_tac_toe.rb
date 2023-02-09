class TicTacToe
    attr_accessor :board
    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
        
    end
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end
    def input_to_index(string)
        input = string.to_i
        input -= 1
    end
    def move(location, player)
        board[location] = player
    end
    def position_taken?(position)
        if board[position] != " "
            true
        else
            false
        end
    end
    def valid_move?(position)
        if position > 8 || position < 0
            false
        else
            if board[position] == " "
                true
            else
                false
            end
        end
    end
    def turn_count
        board_tally = board.tally
        if board_tally["X"] == nil
            0
        elsif board_tally["O"] == nil
            1
        else
            board_tally["X"] + board_tally["O"]
        end
    end
    def current_player
        # turn_count is last played
        # if odd, the next player is even ("O")
        if turn_count.odd?
            "O"
        else
            "X"
        end
    end
    def turn
        puts "Please enter a number (1-9):"
        input = gets.strip
        input = input_to_index(input)
        if valid_move?(input)
            move(input, current_player)
        else
            turn
        end
        display_board
    end
    def won?
        WIN_COMBINATIONS.any? do |combo|
            combinations = [board[combo[0]]] + [board[combo[1]]] + [board[combo[2]]]
            combinations = combinations.uniq
            if (combinations.length == 1 && combinations != [" "])
                return combo
            end
        end
    end
    def full?
        if board.include? " "
            false
        else
            true
        end
    end
    def draw?
        if (full? && won? == false)
            true
        else
            false
        end
    end
    def over?
        won? || draw?
    end
    def winner
        if won?
            board[won?[0]]
        end
    end
    def play
        turn until over? 
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end

