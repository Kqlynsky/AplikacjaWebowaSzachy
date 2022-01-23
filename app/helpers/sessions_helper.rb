module SessionsHelper
    def log_in(player)
      session[:player_id] = player.id
    end
  
    def current_player
      @current_player ||= Player.find_by(id: session[:player_id])
    end
  
    def logged_in?
      !current_player.nil?
    end
  
    def log_out
      session.delete(:player_id)
      @current_player = nil
    end
  
    def require_token
      respond_to do |format|
        format.json {
          authenticate_token || render_unauthorized("Access denied")
        }
        format.html { }
      end
    end
  
    def render_unauthorized(message)
      errors = { errors: [ { detail: message } ] }
      render json: errors, status: :unauthorized
    end
  
    def authenticate_token
      authenticate_with_http_token do |token, options|
        @current_player ||= Player.find_by(token: token)
      end
    end
  end