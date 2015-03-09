require 'dragonfly'

## initialize Dragonfly ##

app = Dragonfly.app(:images)
plugin :rails
plugin :imagemagick

## configure it ##

Dragonfly.app(:images).configure do |c|
  # Convert absolute location needs to be specified
  # to avoid issues with Phusion Passenger not using $PATH
  c.convert_command  = `which convert`.strip.presence || "/usr/local/bin/convert"
  c.identify_command = `which identify`.strip.presence || "/usr/local/bin/identify"

  c.allow_fetch_url  = true
  c.allow_fetch_file = true

  c.url_format = '/images/dy/:job/:basename.:format'
end
