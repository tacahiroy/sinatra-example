# coding: utf-8 
require "bundler/setup"

configure do
  set :app_file, __FILE__
  set :server, %w[thin mongrel webrick]

  enable :sessions
end

helpers do
  def hello(word)
    "Hello #{word}"
  end
end


class Author < ActiveRecord::Base
  has_many :books
end

class Book < ActiveRecord::Base
  belongs_to :author
end


##
# routing
#
get "/" do
  slim :index, :format => :html
end

post "/greeting" do
  slim :greeting, :format => :html
end

__END__
