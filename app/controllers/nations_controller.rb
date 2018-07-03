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


    @nations = []
    json.each do |nation|
      @nations << nation["country"]
    end


    split_groups = json.group_by {|nation| nation["group_letter"] }

    @groups = []
    split_groups.each do |group|
      @groups << group.first

    end
     group_hash = Hash[@groups.map {|group, nations| [group, nations]}]

  end

  def world_cup_groups

  end
end
