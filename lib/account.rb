require 'date'

class Account
  STANDARD_VALIDITY_YRS = 5
attr_accessor :balance, :status, :owner
attr_reader :pin_code, :exp_date
  def initialize(attrs = {})
    @pin_code = generate_pin
    @balance = 0
    @exp_date = set_expire_date
    @status = :active
    @owner = set_owner(attrs[:owner])
  end

private
def generate_pin
  rand(1000..9999)
end

def set_expire_date
  Date.today.next_year(5).strftime('%m/%Y')
end

def deactivate
  @status = :deactivated
end

def self.deactivate(account)
  account.status = :deactivated
end

def set_owner(obj)
  obj == nil ?  missing_owner : obj
end

def missing_owner
  raise "An Account owner is required"
end
  end
