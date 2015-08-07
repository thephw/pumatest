#daemonize true
workers 4
threads 0, 6
worker_timeout 45
preload_app!

rackup      DefaultRackup
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  ActiveRecord::Base.establish_connection
end

basedir = %x[pwd].chomp
puts basedir

directory "#{basedir}"
pidfile  "#{basedir}/tmp/pumatest.pid"
state_path "#{basedir}/tmp/pumatest.state"
stdout_redirect "#{basedir}/log/puma.log", "#{basedir}/log/puma.error.log", true
bind "unix://#{basedir}/tmp/pumatest.sock"
activate_control_app "unix://#{basedir}/tmp/melody_control.sock"
