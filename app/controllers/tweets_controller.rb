class TweetsController < ApplicationController
    require 'twitter'
    def index

    end

    def create
        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = '3uJYPJ6PzHEeH6OL7hjMt23nP'
            config.consumer_secret     = '5b00MNDBDlchHm4tp6Oisdao9ufhPlZZubyOzOPG2YQ1cUI3Rl'
            config.access_token        = "1014146447665659904-kBw19rr4EdWNyzhR9MjjCFwgjhaeQ3"
            config.access_token_secret = "CyyqnVhwsdTcpzEruvMhmD5lE9fJBBTsgGjS1KGXuA903"
          end
          '%#{params[:tweet]}%'
          @tweets = client.search(params[:tweet], :result_type => "recent").take(20)
          rescue Twitter::Error::TooManyRequests => error
              # NOTE: Your process could go to sleep for up to 15 minutes but if you
              # retry any sooner, it will almost certainly fail with the same exception.
              sleep error.rate_limit.reset_in + 1
          retry
    end

    #private
    #def tweet_param
    #    params.require(:tweets).permit(:text)
    #end
end
