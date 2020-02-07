# frozen_string_literal: true

workers ENV.fetch('RAILS_MAX_WORKERS') { 1 }
threads 1, 6
environment ENV.fetch('RAILS_ENV') { 'production' }
plugin :tmp_restart
app_dir = File.expand_path('../..', __dir__)
shared_dir = "#{app_dir}/shared"
bind "unix://#{shared_dir}/sockets/puma.sock"
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"
activate_control_app
preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
