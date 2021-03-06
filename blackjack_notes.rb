#################
####Blackjack####
#################
<<<<<<< HEAD
##  added by -Kevin

##added my Dev branch- kellie
=======


>>>>>>> 32d93cda9d564fe3e0242fb67ba14cba030f3ba2
#Classes
    #player
        #create the following accessable properties: *attr_accessor*
        #name
        #bankroll(start with 100)
        #hand (array to store cards)

        class Player
            attr_accessor :name, :bankroll, :total
            attr_reader :cards

            def start_game
                @cards = []
                @total = 0
                @bankroll = 100
                @name = name
            end
        end

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
        RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
        SUITS = ['club', 'spade', 'heart', 'diamond']
    end

#Gameplay
    #Player chooses their name
        #creates a new player class
    #Game start 
        #method: *deal* two random cards generated for house and player
            #sample method (grabs random items from array)
        #method: *add_cards* adds the two randomly generated cards for house and player
        #method: *compare* compare the total of cards generated for house and player 
        #method: *win* substracts 10 from the losing party and adds 10 to the winning party
            #tie > puts a message to the player. nothing is affected.
        
        ##consider writing a switch case statement to cover all situations
#goat squad