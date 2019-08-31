class Helper

  def self.current_user(session)
    User.find_by :id=>session[:user_id]
  end

  def self.log_in?(session)
    !!session[:user_id]
  end


end
