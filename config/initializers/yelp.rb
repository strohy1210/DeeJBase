YELP = Yelp::Client.new(
    { consumer_key: ENV['consumer_key'],
      consumer_secret: ENV['consumer_secret'], 
      token: ENV['token'],
      token_secret: ENV['token_secret']                       
    })