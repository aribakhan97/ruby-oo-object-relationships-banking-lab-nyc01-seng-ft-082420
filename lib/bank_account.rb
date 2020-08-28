class BankAccount

attr_accessor :balance, :status
attr_reader :name

    def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"  
    end 
    
    # def self.all 
    # @@all
    # end  -->> why do we not need to use this?
    

    def deposit(moneys)
        self.balance += moneys
    end 

    def display_balance
        "Your balance is $#{balance}."
    end 

    def valid?
        balance > 0 && status == "open"              
    end 

    def close_account
        self.status = "closed"
    end 

end
