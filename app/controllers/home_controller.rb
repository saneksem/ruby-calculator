require File.expand_path('../../lib/calculator', File.dirname(__FILE__))

class HomeController < ApplicationController

  def index
    case params[:operation]
      when 'sum', 'subtr', 'div'
        @result = Calculator.fix_int(params[:a]).to_s + ' ' +
            Calculator.get_operator(params[:operation]) + ' ' +
            Calculator.fix_int(params[:b]).to_s + ' = ' +
            Calculator.send(params[:operation], *[params[:a], params[:b]]).to_s
      when 'sqrt', 'sin', 'cos'
        @result = Calculator.get_operator(params[:operation]) + '(' + Calculator.fix_int(params[:a]).to_s + ') = ' +
            Calculator.send(params[:operation], *[params[:a]]).to_s
      else
        @result = nil
    end
  end

end
