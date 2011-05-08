# main.rb
require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-validations'
require 'logger'


## CONFIGURATION
configure :development do
  DataMapper.setup(:default, {
    :adapter  => 'mysql',
    :host     => 'localhost',
    :port     => '8889',
    :username => 'root' ,
    :password => 'root',
    :database => 'sinatra'})  

  DataMapper::Logger.new(STDOUT, :debug)
end

configure :production do
  DataMapper.setup(:default, {
    :adapter  => 'mysql',
    :host     => 'localhost',
    :port     => '8889',
    :username => 'root' ,
    :password => 'root',
    :database => 'sinatra'})  
end

### MODELS
class Table
  include DataMapper::Resource
  property :id,         Integer
  property :field1,      String
  property :field1,      String
end

### CONTROLLER ACTIONS

# index
get '/' do
 
    
end

# create
post '/' do
  todo=Todo.create(:title=>params[:title],:created_at=>Time.now)
  redirect '/'
end

# mark complete / incomplete
get '/:id/mark/:is_complete' do
  todo=Todo.get(params[:id])
  todo.update_attributes(:complete=>(params[:is_complete]=='complete'))
  redirect '/'
end

get '/:id/delete' do
  todo=Todo.get(params[:id]).destroy
  redirect '/'
end

# SASS stylesheet
get '/stylesheets/style.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :style
end