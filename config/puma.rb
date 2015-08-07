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
directory "/srv/www/melody/current"
pidfile  "/srv/www/melody/shared/pids/melody.pid"
state_path "/srv/www/melody/shared/puma/melody.state"
stdout_redirect '/srv/www/melody/current/log/puma.log', '/srv/www/melody/current/log/puma.error.log', true
bind "unix:///srv/www/melody/shared/puma/melody.sock"
activate_control_app "unix:///srv/www/melody/shared/puma/melody_control.sock"
