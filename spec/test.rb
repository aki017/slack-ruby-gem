require 'colored'
require_relative '../lib/slack'

s = Slack::Client.new
s.token = '' # request a token on https://api.slack.com/web#basics

if s.token == ''
  raise "Undefined token ! Please set a token in spec/test.rb to run the tests."
end

FAILING_ERRORS = [
  "restricted_action",
  "not_authed",
  "invalid_auth",
  "account_inactive"
]

width = 3 + Slack::Client::METHODS.map(&:length).max
all_true = true

puts "Trying all the methods one by one..."
Slack::Client::METHODS.each do |meth|
  print "* #{meth.to_s.bold.yellow} "
  print '.' * (width - meth.length)

  res = s.base_method meth
  is_ok = res['ok'] || not(FAILING_ERRORS.include? res['error'])
  all_true &&= is_ok

  puts "[#{is_ok ? "OK".green : "NO".red}]"
  p res unless is_ok
end

raise "Some error happenned !" unless all_true
