require "pry"

class TicTacToe
attr_accessor :board

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[1,4,7],[6,4,2],[2,5,8],[0,3,6]]


  def initialize
    @board = [" ", " ", " "," ", " ", " ", " "," ", " "]
  end

def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(string)
selection = string.to_i - 1
end

def move (index, token = "X")
board[index] = token
end

def position_taken?(index)
(board[index] != " ")
end

def valid_move?(index)
  (board[index] == " ")
end

def turn_count
9 - board.count(' ')
end

def current_player
self.turn_count.even? ? "X" : "O"
end

def turn
input = gets
self.turn unless (1..9).include?(input.to_i)
position = self.input_to_index(input)
 if valid_move?(position)
move(position, self.current_player)
self.display_board
end
end

def won?
  WIN_COMBINATIONS.any? do |combo|
  if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
   return  combo   
end
end
end

def full?
  !board.include?(" ")
end

def draw?
self.full? && !self.won? 
end

def over?
   self.draw? || self.won? 

 end

 def winner
  if self.won?
    (self.current_player == "X") ? "O" : "X"
  end
  end

  def play 
until self.over?
  self.turn
end
if self.won?
 puts "Congratulations #{self.winner}!"
  
elsif self.draw?
 puts "Cat's Game!"
end
end
binding.pry
end