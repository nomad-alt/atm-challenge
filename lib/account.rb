require 'date'

class Account
  STANDARD_VALIDITY_YRS = 5
attr_accessor :pin_code, :balance, :exp_date

  def initialize
    @pin_code = generate_pin
    @balance = 0
    @exp_date = set_expire_date
end

private
def generate_pin
  rand(1000..9999)
end

def set_expire_date
  Date.today.next_year(5).strftime('%m/%Y')
end
  end
