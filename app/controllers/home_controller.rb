require File.expand_path('../../lib/calculator', File.dirname(__FILE__))

class HomeController < ApplicationController

  def index
    @result = 'Calculation result: '
    case params[:operation]
      when 'sum', 'subtr', 'div'
        @result = Calculator.send(params[:operation], *[params[:a], params[:b]])
      when 'sqr', 'sin', 'cos'
        @result = Calculator.send(params[:operation], *[params[:a]])
      else
        @result = nil
    end
  end

  def new
    @result = (params[:a]=="" or params[:b]=="") ? nil : params[:a].to_f + params[:b].to_f
    @result = Calculator.send(params[:operation], *[params[:a], params[:b]])
    render :index
  end
end
