module HerokuLogplexMessageParser
  def parse_logplex_message(req)
    message_count = req.env['HTTP_LOGPLEX_MSG_COUNT']
    frame_id = req.env['HTTP_LOGPEX_FRAME_ID']
    drain_token = req.env['HTTP_LOGPLEX_DRAIN_TOKEN']
    user_agent = req.env['HTTP_USER_AGENT']
    content_type = req.env['HTTP_CONTENT_TYPE']

    {
      message_count:  message_count,
      frame_id:       frame_id,
      drain_token:    drain_token,
      user_agent:     user_agent,
      content_type:   content_type
    }
  end

  def valid_logplex_headers?(headers)
    headers[:drain_token] == ENV['LOGDRAIN_LOGPLEX_DRAIN_TOKEN']
  end
end
