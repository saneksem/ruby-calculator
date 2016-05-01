require File.expand_path('../../lib/calculator', File.dirname(__FILE__))

class HomeController < ApplicationController

  def index
    @result = ''
    case params[:operation]
      when 'sum', 'subtr', 'div'
        if params[:a].to_s=='' or params[:b].to_s==''
          @result = 'Please, enter both operands!'
        else
          @result = Calculator.fix_int(params[:a]).to_s + ' ' +
              Calculator.get_operator(params[:operation]) + ' ' +
              Calculator.fix_int(params[:b]).to_s + ' = ' +
              Calculator.send(params[:operation], *[params[:a], params[:b]]).to_s
        end
      when 'sqrt', 'sin', 'cos'
        if params[:a].to_s==''
          @result += 'Please, enter first operand!'
        else
          @result = Calculator.get_operator(params[:operation]) + '(' + Calculator.fix_int(params[:a]).to_s + ') = ' +
              Calculator.send(params[:operation], *[params[:a]]).to_s
        end
      else
        @result = nil
    end
  end

end
