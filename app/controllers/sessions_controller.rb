class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new; end

  def create
    respond_to do |format|
      player = Player.find_by(index: params[:session][:index])
      if player && player.authenticate(params[:session][:password])
        format.html do
          log_in player
          redirect_to player
        end
        format.json do
          player.password = params[:session][:password]
          player.regenerate_token
          render json: { token: player.token }
        end
      else
        format.html do
          render 'new'
        end
        format.json do
          render json: { message: 'Niepoprawne dane' }
        end
      end
    end
 end

  def destroy
    respond_to do |format|
      format.html do
        log_out
        redirect_to root_url
      end
      format.json do
        require_token
        if current_player
          current_player.invalidate_token
          head :ok
        end
      end
    end
  end
end