# routes.rb

Rails.application.routs.draw do
  get '/yips', to: 'yips#index'
end

#command _ P (or command + T_ to search files in VSCode)

#things we need for our routes:
#   verb
#   path
#   controller
#   action 
#   optional: alias

manually create controllers
because theres a lot of extra stuff going on

class YipsController < ApplicationController
  # ApplicationController is what gives us our rails magic
  #   allows router to communicate with the controller 

  # gives us connects to everything
  # where rails magic happens

  # active query method
  def index
    @yips = Yip.all
    # render information - render is a method
    render :json @yips
      # jason is really readable
      # string that looks like a hash
      # send that to browswer for it read
  end

  # bundle exec rails server
    # * data bases are local - that's why you need migration files *

  # get json extensions in your browser

  # make sure to control c
    #cause if you just quit the server will still 
    #run and clog up the terminal?


  Rails.application.routes.draw do
    # for details of the DSL available within this file

    # very explicit way
      # get '/yips', to 'yips#index'
      # # 'yips#index' refers to the controller method 'index'

      # patch '/yips/:id', to 'yips#update'
      # # 'yips#index', refers to the controller 'update'

      # post '/yips', to 'yips#create'

      # get '/yips/:id', to 'yips#show'

      # delete '/yips/:id', to 'yips#destroy'
                # path            http verb

    # resource name, [options hash]
    # line 63 and 64 gives us the same routes
      resource :yips, only: [:index, :show, :create, :update, :destroy]
      # resource :yips, execpt: [:new, :edit]

      # to get all of the routes
        # resource :yips


    #---------------
      # routes are a way to find a single route
  end

  # prefixes
    # url helper

  # will these controller work on other tables

  # rails router and RESTful Routes

  # controllers now
  #   we can rename index into banana


  # get used to 
  #   reading bundle exec rails routes

  # url helper methods
  # wildcards, pattern matching
    # technically for ids
    # bu can be for others but focus is on ids

  def show
    @yip = Yip.find(params[:id])
      # params finds a specific yip

    render json: @yip
    
  end


  turn off something
  class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
  end
end


---------------

bundle exect rails s

make a new yip one at a time
  post a yips

  require yip

postman

post
  key         value                   description
  yip(body)   demonstrating params!   


ask how to specify a rails version when starting a project