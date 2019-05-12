module Authorization
  def authorized?(req)
    auth = Rack::Auth::Basic::Request.new(req.env)
    auth.provided? &&
      auth.basic? &&
      auth.credentials &&
      auth.credentials == [ENV['LOGDRAIN_USERNAME'], ENV['LOGDRAIN_PASSWORD']]
  end
end
