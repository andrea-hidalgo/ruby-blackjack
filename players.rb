class Player
    attr_accessor :name, :bankroll, :hand_total
    attr_reader :cards

    def initialize name, bankroll
        @cards = []
        @hand_total = 0
        @name = name
        @bankroll = bankroll
        
    end
    def get_cards(card)
        @cards << card
        @hand_total += card.value
      end
    
end

human = Player.new "Ryan", 100
dealer = Player.new "Dealer", 10000
p human
p dealer
