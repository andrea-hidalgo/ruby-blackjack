

#Classes
    #Player
        #main class

    #Human - instance of Player class
        #create the following accessable properties: *attr_accessor*
        #name
        #bankroll(start with 100)
        #hand (array to store cards)

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
                #checks if deck array is empty, if it is, placeholder for a restart game method
                #if deck array is full, it removes 2 cards from the deck array and assigns it to the cards property
                deck.empty? ? ( p "No more cards, want to start another game?" ) : ( @cards = deck.shift(2) )
            end
            
        end
        # human = Player.new
    #house
        #create the following accessable properties: *attr_accessor*
        #name
        #bankroll(start with 10,000)
        #hand(array to store cards)

    #card
        #create the following readable properties: 
            #value (between 1 and 11)
            #suit
            #face
        ###every time a card is created, add into the deck array
        ###create 13 individual cards (one set), then make 4 copies to end up with 4 sets
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

#The Deck
    #empty array
    class Deck
        attr_reader :deck
        # ranks/suits for each of the cards
        RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
        SUITS = ['♣', '♠', '♥', '♦']
      
        def initialize
          @deck = []
          # i create an empty array called deck and then for I create a new card and pass through a rank and suit and push them into the array
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
 # spawning the classes below here
    # human = Player.new
    # computer = Player.new
    # new_deck = Deck.new

    

    # new_deck.deck
    # computer.get_card new_deck.deck
    # human.get_card new_deck.deck
    # p human 
    # p computer
    # # randomized the deck we created using shuffle method
    # p new_deck.deck.size
    
    # prints the new fully shuffled deck that was created
# p new_deck

#Gameplay
    #Player chooses their name
        #creates a new player class
    #Game start 

        #method: *deal* two random cards generated for house and player
        # need a method to remove the cards taken so no card is taken twice 
            #sample method (grabs random items from array) Kellie, Andrea
        #method: *add_cards* adds the two randomly generated cards for house and player
        #method: *compare* compare the total of cards generated for house and player
       #create a cardnumber for player and computer. Then puts a value for the player and the computer based on the cardnumber that they get
    #humanTotal = human.cards.reduce(0){|sum, card| sum + card.value} 
   # computerTotal = computer.cards.reduce(0){|sum, card| sum + card.value} 
    #now compare computer total and human total using if statements for different scenarios. Ex: If humantotal > 21 the human loses
      
        #method: *compare* compare the total of cards generated for house and player 
            #Allegra and Parker
        #method: *win* substracts 10 from the losing party and adds 10 to the winning party
            ## bankroll- updating Kevin, Marsallis
            #tie > puts a message to the player. nothing is affected.
         #win Joe/
        ##consider writing a switch case statement to cover all situations





### while loop to keep the game going until one player loses all their money or player quit

# a = 0
# while a < 5 do
# 	p a
# 	a+=1 //++ does not exist. must do +=1 or another increment number
# end
def gameplay human, computer
    new_deck = Deck.new
    new_deck.shuffle
    human.get_card new_deck.deck
    computer.get_card new_deck.deck
    human_hand = [human.cards[0].value, human.cards[0].suit, human.cards[1].value, human.cards[1].suit]
    p "human hand is: #{human_hand}"
    card_total = human.cards[0].value += human.cards[1].value
    computer_card_total = computer.cards[0].value + computer.cards[1].value
    p "players total hand value is: #{card_total}"
    computer_hand = [computer.cards[0].value, computer.cards[0].suit, computer.cards[1].value, computer.cards[1].suit]
    p "computer hand is: #{computer_hand}"
    p "computers total hand value is: #{computer_card_total}"
    if card_total > computer_card_total
        human.bankroll += 10 
        computer.bankroll -= 10
        p "player wins! human bankroll is #{human.bankroll}, computer loses! computer bankroll is #{computer.bankroll}"
    end
    if computer_card_total > card_total
        computer.bankroll += 10 
        human.bankroll -= 10
        p "player loses! human bankroll is #{human.bankroll}, computer wins! computer bankroll is #{computer.bankroll}"
    end
    if card_total == computer_card_total
        p "it was a tie! human bankroll is still #{human.bankroll} and computer bankroll is still #{computer.bankroll}"
    end
end

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

# The over all game loop that calls on all other functions
def game_start playername 
    human = Player.new 
    human.name = playername
    human.bankroll = 100
    computer = Player.new
    computer.bankroll = 1000
    p human
    p computer
    gameplay human, computer
    while human.bankroll >= 10 || computer.bankroll >= 10 do
       play_again? human, computer
    end
end

# function to get players name & asks them if they want to play via console. The response to "do you want to play" can be tied to the game loop maybe? If we still want to go that way. 

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

