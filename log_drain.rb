require 'cuba'
require 'cuba/safe'
require './authorization'
require './heroku_logplex_message_parser'

Cuba.plugin Authorization
Cuba.plugin HerokuLogplexMessageParser

Cuba.define do
  on post do
    on "logs" do
      if authorized?(req)
        logplex_headers = parse_logplex_message(req)
        if valid_logplex_headers?(logplex_headers)
          res.write "Message count: #{logplex_headers[:message_count]}"
          res.write "noot noot"

          # TODO: Wrap this in a module
          require 'aws-sdk-kinesis'
          options = {
            region: 'us-east-2'
          }
          client = Aws::Kinesis::Client.new(options)
          records = [
            {
              data: "noot noot",
              partition_key: "1"
            }
          ]
          params = {
            records: records,
            stream_name: 'test'
          }
          client.put_records(params)
        end
      end
      res.write nil
    end
  end
end
