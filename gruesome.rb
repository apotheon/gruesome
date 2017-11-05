#!/usr/bin/env ruby
require 'sinatra/base'
require 'red_rug'
require 'yaml'

class Gruesome < Sinatra::Base
  def make_path(relative_path)
    File.join(File.dirname(File.expand_path __FILE__), relative_path)
  end

  before do
    @site_initials = 'GI'
    @site_title = 'Gruesome Info'
    @slogan = "Won't you stay for dinner?"
  end

  get '/' do
    @page_title = 'The Grue'
    @content = RedRug.from_file make_path 'public/content/index.txt'
    @footer = RedRug.from_file make_path 'public/content/footer.txt'

    erb :home
  end

  not_found do
    erb :'404'
  end

  run! if app_file == $0
end
