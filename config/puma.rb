daemonize true
workers 4
threads 0, 6
worker_timeout 45
preload_app!

rackup      DefaultRackup
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
basedir = "Users/patrickwiseman"
directory "/#{basedir}/src/pumatest"
pidfile  "/#{basedir}/src/pumatest/tmp/pumatest.pid"
state_path "/#{basedir}/src/pumatest/tmp/pumatest.state"
stdout_redirect "/#{basedir}/src/pumatest/log/puma.log", "/#{basedir}/src/pumatest/log/puma.error.log", true
bind "unix:///#{basedir}/src/pumatest/tmp/pumatest.sock"
activate_control_app "unix:///#{basedir}/src/pumatest/tmp/melody_control.sock"
