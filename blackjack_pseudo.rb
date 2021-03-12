#####################################
##########TEAM GOAT BLACKJACK########
#####################################

#Classes
    #Player
        #main class

    #Human - instance of Player class
        #create the following accessable properties: *attr_accessor*
        #name
        #bankroll(start with 100)
        #hand (array to store cards)
    #computer
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
    #The Deck
        #empty array

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