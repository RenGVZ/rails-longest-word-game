require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { (65 + rand(26)).chr }
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    @found = getApi['found']
  end

  def getApi
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_serialized = open(url).read
    p user = JSON.parse(user_serialized)
  end
end
