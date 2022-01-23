class StaticController < ApplicationController
    def index
      @some_variable = 123
    end
    def feed
    end
    def index
        @players = Player.all
      end
  end