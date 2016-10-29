require_relative 'spec_helper'

# Postfix should be running...
describe service('httpd') do
  it { should be_running }
end

describe command('curl localhost') do
  its(:stdout) { should match('amzapache - default web page') }
end
