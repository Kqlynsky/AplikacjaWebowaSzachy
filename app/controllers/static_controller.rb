class StaticController < ApplicationController
  before_action :require_token, only: [:feed]
    def index
        @players = Player.all
      end
      def feed
      end
  end