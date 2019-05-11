require 'cuba'

Cuba.define do
  on post do
    on "logs" do
      res.write nil
    end
  end
end
