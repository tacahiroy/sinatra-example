# coding: utf-8 
require "bundler/setup"

class Author < ActiveRecord::Base
  has_many :books
end

class Book < ActiveRecord::Base
  belongs_to :author
end


configure :development do
  enable :sessions, :clean_trace
  disable :logging, :dump_errors
end

configure do
  set :app_file, __FILE__
  set :root, File.dirname(__FILE__)
  set :server, %w[thin mongrel webrick]
  set :slim, { :format => :html5 }

  enable :static, :sessions
end

helpers do
  def hello(word)
    "Hello #{word}"
  end
end

##
# routing
#
get "/" do
  slim :index
end

post "/greeting" do
  slim :greeting
end

__END__
