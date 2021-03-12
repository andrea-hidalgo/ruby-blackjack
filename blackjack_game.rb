#####################################
##########TEAM GOAT BLACKJACK########
#####################################

####Classes####

#The Player class is the parent of both the computer and the human player objects
class Player
    attr_accessor :name, :bankroll, :total
    attr_reader :cards

    def player_start
        @cards = []
        @total = 0
        @bankroll = bankroll
        @name = name
    end
    def get_card deck
        @cards = deck.shift(2)
    end
    
end

class Card
    attr_reader :rank, :suit
    attr_accessor :value
    def initialize(rank, suit)
        @rank = rank
        @suit = suit
        @value = 0
        get_card_value
    end
    def get_card_value
        case @rank
        when 2
            @value = 2
        when 3
            @value = 3
        when 4
            @value = 4
        when 5
            @value = 5
        when 6
            @value = 6
        when 7
            @value = 7
        when 8
            @value = 8
        when 9
            @value = 9
        when 10, 'J', 'Q', 'K'
            @value = 10
        when 'A'
            @value = 11
        end
    end
end

class Deck
    attr_reader :deck
    # ranks/suits for each of the cards
    RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
    SUITS = ['♣', '♠', '♥', '♦']
    
    def initialize
        @deck = []
        # create an empty array called deck and then for each element create a new card and pass through a rank and suit, then push them into the array
        SUITS.each do |suit|
        RANKS.each do |rank|
            @deck << Card.new(rank, suit)
        end
        end
    end
    #method to randomize the deck
    def shuffle
        @deck = @deck.shuffle
    end
end

####Gameplay methods below####

def gameplay human, computer
    #create the deck
    new_deck = Deck.new
    new_deck.shuffle
    #assign cards from the deck to human and computer
    human.get_card new_deck.deck
    computer.get_card new_deck.deck
    
    #set array that will hold information about human cards
    human_hand = [human.cards[0].value, human.cards[0].suit, human.cards[1].value, human.cards[1].suit]
    p "#{human.name}\'s hand is: #{human_hand}"
    #assign the total value of each players' cards to a variable
    card_total = human.cards[0].value += human.cards[1].value
    computer_card_total = computer.cards[0].value + computer.cards[1].value
    p "#{human.name}\'s total hand value is: #{card_total}"
    #set array that will hold information about computer cards
    computer_hand = [computer.cards[0].value, computer.cards[0].suit, computer.cards[1].value, computer.cards[1].suit]
    p "The computer\'s hand is: #{computer_hand}"
    p "The computer\'s total hand value is: #{computer_card_total}"

    #compare the total values of the computer and human card totals, then change their bankrolls as appropiate
    if card_total > computer_card_total
        human.bankroll += 10 
        computer.bankroll -= 10
        p "#{human.name} wins! #{human.name}\'s bankroll is #{human.bankroll}. The computer loses! Computer bankroll is #{computer.bankroll}"
    end
    if computer_card_total > card_total
        computer.bankroll += 10 
        human.bankroll -= 10
        p "#{human.name} loses! #{human.name}\'s bankroll is #{human.bankroll}. The computer wins! Computer bankroll is #{computer.bankroll}"
    end
    if card_total == computer_card_total
        p "It was a tie! #{human.name}\'s bankroll is still #{human.bankroll} and Computer bankroll is still #{computer.bankroll}"
    end
end

#the play_again? method asks the human player whether they would like to play again, if they do, the gameplay method is called
def play_again? human, computer
    puts "Do you want to play again (Y/N)?"
    another_hand = gets.chomp.capitalize
    if another_hand == "Y"
        gameplay human, computer
    else 
        puts "Okay, game over. Your final bankroll is #{human.bankroll}"
        get_name
    end
end

# The game_start method creates human and computer objects and assigns values to them as appropriate
# It then calls the gameplay method to create the deck and find the winner
# The while loop makes sure the gameplay will continue until either the human or the computer run out of money.
def game_start playername 
    human = Player.new 
    human.name = playername
    human.bankroll = 100
    computer = Player.new
    computer.bankroll = 1000

    gameplay human, computer
    while human.bankroll >= 10 || computer.bankroll >= 10 do
        play_again? human, computer
    end
end

# This is the first method to run. get_name gets players name & asks them if they want to play. It passes the player's name to the game_start method, where the human and computer objects are then created. 
def get_name 
    puts "Welcome to Ruby Blackjack. What's your name?"
    @playername = gets.chomp.capitalize
    puts "Hi #{@playername}, do you want to play (Y/N)?"
    @game_loop = gets.chomp.upcase
    if @game_loop == "Y"
        game_start @playername
    else
        puts "No game for you"
    end   
end

get_name