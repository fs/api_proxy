$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'httparty'
require "api_proxy"

run ApiProxy::App.new
