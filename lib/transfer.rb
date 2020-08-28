class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver
   

    def initialize(sender, receiver, amount)
       @status = "pending" 
       @sender = sender
       @receiver = receiver
       @amount = amount
       ##ORDER MATTERS!!!??? 
    end 

    def valid?
      receiver.valid? && sender.valid?
    end 

    def execute_transaction
      if valid? && sender.balance > amount && self.status == "pending"
        sender.balance -= amount
        receiver.balance += amount 
        self.status = "complete"
      else reject_money
      end 
    end 
    # check balance to see if theres enough $$, then change status to pending,
    #the sender balance will send $$ aka -
    #the receiver balance will accept $$ aka +
    #set status to complete
    #otherwise we will reject 

    def reverse_transfer
      if valid? && receiver.balance > amount && self.status == "complete"
      sender.balance += amount 
      receiver.balance -= amount 
      self.status = "reversed"
      else reject_money
      end 
    end 

    

    
    ## how we do know we need to create a method to reject a method?
    def reject_money
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
end
