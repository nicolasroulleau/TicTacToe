class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)
attr_accessor :value

  def initialize(value = " ")
    #TO DO doit régler sa valeur, ainsi que son numéro de case
    @value = value
  end
  
  def to_s
    #TO DO : doit renvoyer la valeur au format string
    return @value.to_s
  end

end


class Board
  include Enumerable
  #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases
  attr_accessor :tab

  def initialize
  #TO DO :
  #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
  #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
    @a1 = BoardCase.new
    @a2 = BoardCase.new
    @a3 = BoardCase.new
    @b1 = BoardCase.new
    @b2 = BoardCase.new
    @b3 = BoardCase.new
    @c1 = BoardCase.new
    @c2 = BoardCase.new
    @c3 = BoardCase.new
  end


  def win_combos # array de 8 sous-arrays qui sont les combinaisons gagnantes
    [[@a1.value, @a2.value, @a3.value],
    [@a1.value, @b2.value, @c3.value],
    [@a1.value, @b1.value, @c1.value],
    [@b1.value, @b2.value, @b3.value],
    [@c1.value, @c2.value, @c3.value],
    [@c1.value, @b2.value, @a3.value],
    [@a2.value, @b2.value, @c2.value],
    [@a3.value, @b3.value, @c3.value]]
  end

  def victory? # méthode vérifiant si une des combinaisons gagnantes a été obtenue
    win_combos.each do |combos| 
    if combos[0] == "O" && combos[1] == "O" && combos[2] == "O"
      print_grid
      puts "Player 2 wins ! Congratulations !"
      exit 
    elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X"
      print_grid
      puts "Player 1 wins ! Congratulations !"
      exit
    #else
      #puts "Tie! Enter q to quit game."
    end
  end
end

  def print_grid
  #TO DO : afficher le plateau
    puts
    puts "   1   2   3"
    puts "A  #{@a1} | #{@a2} | #{@a3} " 
    puts "  ---|---|---"
    puts "B  #{@b1} | #{@b2} | #{@b3} "
    puts "  ---|---|---"
    puts "C  #{@c1} | #{@c2} | #{@c3} "
    puts
  end


  def player_one
    # méthode qui change la BoardCase jouée en fonction de la valeur du joueur 1 (X)
    print_grid
    puts "player 1 please choose a cell:"
    input = gets.chomp.downcase
    case input 
      when "a1" 
        @a1.value = "X"
      when "a2" 
        @a2.value = "X"
      when "a3" 
        @a3.value = "X"
      when "b1" 
        @b1.value = "X"
      when "b2" 
        @b2.value = "X"
      when "b3" 
        @b3.value = "X"
      when "c1" 
        @c1.value = "X"
      when "c2" 
        @c2.value = "X"
      when "c3" 
        @c3.value = "X"
      else puts "wrong input please try again"
        player_one
      end
    victory? # on vérifie si une combinaison gagnante a été obtenue
    player_two # on passe au joueur 2
  end

  def player_two
    # méthode qui change la BoardCase jouée en fonction de la valeur du joueur 2 (O)
    print_grid
    puts "player 2 please choose a cell:"
    input = gets.chomp.downcase
    case input 
      when "a1" 
        @a1.value = "O"
      when "a2" 
        @a2.value = "O"
      when "a3" 
        @a3.value = "O"
      when "b1" 
        @b1.value = "O"
      when "b2" 
        @b2.value = "O"
      when "b3" 
        @b3.value = "O"
      when "c1" 
        @c1.value = "O"
      when "c2" 
        @c2.value = "O"
      when "c3" 
        @c3.value = "O"
      else puts "wrong input please try again"
        player_two
      end
    victory? # on vérifie si une combinaison gagnate a été obtenue
    player_one # on repasse au joueur 1
  end

end


class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?
  attr_accessor :name, :team
  attr_writer :status
  
  def initialize(name)
    @name = name
    @team = team
    # @status = status
  end

  def to_s
    #TO DO : doit renvoyer la valeur au format string
    return @name.to_s
  end
end


class Game
  def initialize
    #TO DO : créé 2 joueurs, créé un board
    puts "Bienvenue au jeu du Tic Tac Toe !"
    sleep(1)
    puts "Joueur 1 identifiez vous svp"
    @name1 = gets.chomp
    puts "Joueur 2 identifiez vous svp"
    @name2 = gets.chomp
    puts @name1 + " plays with X, " + @name2 + " plays with O"
    puts "To place your X or O on the grid, enter the location (ex--a1, b3)."
    puts "To quit, enter Ctrl + c at any time"
    @player1 = Player.new(@name1)
    @player2 = Player.new(@name2)
    @grid = Board.new
  end

  def go
  @grid.player_one

  end

end

Game.new.go