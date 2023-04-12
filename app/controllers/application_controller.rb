class ApplicationController < ActionController::Base
  def blank_square_form
    render({:template => "calculation_templates/square_form.html.erb"})
  end
  def calculate_square
    #params = {"elephant"=>"42"}

    @num = params.fetch("elephant").to_f
    @square_of_num = @num ** 2

    render({:template => "calculation_templates/square_results.html.erb"})
  end
  def blank_random_form
    render({:template => "calculation_templates/random_form.html.erb"})
  end
  def calculate_random

    @max = params.fetch("user_max").to_f
    @min = params.fetch("user_min").to_f
    @random = rand(@min..@max)
    render({:template => "calculation_templates/random_results.html.erb"})
  end
  def blank_square_root_form
    render({:template => "calculation_templates/square_root_form.html.erb"})
  end
  def calculate_square_root

    @rootnum = params.fetch("user_number").to_f
    @sqroot = @rootnum ** 0.5
    render({:template => "calculation_templates/square_root_results.html.erb"})
  end
  def blank_payment_form
    render({:template => "calculation_templates/payment_form.html.erb"})
  end
  def calculate_payment

    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_f
    @principal = params.fetch("user_pv").to_f

    monthly_rate = @apr / 12 / 100
    num_pay = @years * 12
     
    @payment = @principal * (monthly_rate * (1 + monthly_rate)**num_pay) / ((1 + monthly_rate)**num_pay - 1)

    render({:template => "calculation_templates/payment_results.html.erb"})
  end
end
