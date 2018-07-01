require 'open-uri'
require 'json'

class NationsController < ApplicationController
  def index
    all_nations
  end

  private

  def all_nations
    response = open('https://worldcup.sfg.io/teams/')
    json = JSON.parse(response.read)
    raise

    @nations = []
    json.each do |nation|
      @nations << nation["country"]
    end
  end
end
