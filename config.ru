# encoding: utf-8

Encoding.default_external = Encoding::UTF_8

require 'rubygems'
require './app'

run Sinatra::Application
