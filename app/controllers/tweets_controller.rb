class TweetsController < ApplicationController
  
  get '/tweets' do
    @tweets = Tweet.all
    
    if logged_in?
      erb :'tweets/tweets'
    else
      redirect '/login'
    end
  end
  
  get '/tweets/new' do
    if logged_in?
      erb :'/tweets/new'
    else
      redirect '/login'
    end
  end
  
  post '/tweets' do
    content = params[:content]
    id = current_user.id
    
    if content != ""
      @tweet = Tweet.create(content: content, user_id: id)
    else
      redirect '/tweets/new'
    end
  end
  
  get '/tweets/:id' do
    id = params[:id]
    
    if logged_in?
      @tweet = Tweet.find_by_id(id)
      erb :'/tweets/show_tweet'
    else
      redirect to '/login'
    end
  end

end
