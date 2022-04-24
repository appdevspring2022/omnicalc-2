class MathController < ApplicationController
  def addition_form
    render("math_templates/add_form.html.erb")
  end

  def addition_results
    # Parameters: {"first_num"=>"42", "second_num"=>"10"}

    @first = params.fetch("n1").to_f
    @second = params.fetch("n2").to_f

    @result = @first + @second

    render("math_templates/add_results.html.erb")
  end

  def subtraction_form
    render("math_templates/subtract_form.html.erb")
  end

  def subtraction_results
    # Parameters: {"first_num"=>"42", "second_num"=>"10"}

    @first = params.fetch("n1").to_f
    @second = params.fetch("n2").to_f

    @result = @second - @first

    render("math_templates/subtract_results.html.erb")
  end

  def multiplication_form
    render("math_templates/multiply_form.html.erb")
  end

  def multiplication_results
    # Parameters: {"first_num"=>"42", "second_num"=>"10"}

    @first = params.fetch("n1").to_f
    @second = params.fetch("n2").to_f

    @result = @first * @second

    render("math_templates/multiply_results.html.erb")
  end

  def division_form
    render("math_templates/divide_form.html.erb")
  end

  def division_results
    # Parameters: {"first_num"=>"42", "second_num"=>"10"}

    @first = params.fetch("n1").to_f
    @second = params.fetch("n2").to_f

    @result = @first / @second

    render("math_templates/divide_results.html.erb")
  end

  def gmaps
    page_url = "https://maps.googleapis.com/maps/api/geocode/json?address=Chicago%20booth%20harper%20center&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"
    @raw_response=open(page_url).read
    @parsed_response=JSON.parse(@raw_response)
    render({:templates=> "math_templates/gmaps.html.erb"})
  end
  end