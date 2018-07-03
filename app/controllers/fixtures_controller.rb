require 'open-uri'
require 'json'

class FixturesController < ApplicationController
  def index
    get_today_fixtures
  end

  def results
    response = open('https://worldcup.sfg.io/matches')
    json = JSON.parse(response.read)


  end

  private

  def get_today_fixtures
    response = open('https://worldcup.sfg.io/matches/today')
    json = JSON.parse(response.read)

    teams = []
    json.each do |nation|
      teams << nation["home_team_country"]
      teams << nation["away_team_country"]
    end
    @fixtures = teams.each_slice(2).to_a

    @teams_playing_first = @fixtures[0]
    @teams_playing_second = @fixtures[-1]

  end

end
