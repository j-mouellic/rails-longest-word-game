class GamesController < ApplicationController
  require 'open-uri'
  require 'json'

  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    @word = params[:answer]
    answer = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}")
    answer = JSON.parse(answer.read)
    @answer = answer["found"]
  end
end
