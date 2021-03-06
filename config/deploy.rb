lock "3.11.0"

set :application, "freemarket_0609a"
set :repo_url, "git@github.com:mgmmy/freemarket_0609a.git"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/20190609aaa.pem']  

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
  AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"],
  BASIC_AUTH_USER: ENV["BASIC_AUTH_USER"],
  BASIC_AUTH_PASSWORD: ENV["BASIC_AUTH_PASSWORD"]
}

set :linked_files, %w{ config/secrets.yml }

# SSHKit.conifg
SSHKit.config.command_map[:rake] = 'bundle exec rake'

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'upload secrets.yml'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/secrets.yml', "#{shared_path}/config/secrets.yml")
    end
  end
  
  # desc 'db_seed must be run only one time right after the first deploy'
  # task :db_seed do
  #   on roles(:db) do |host|
  #     within current_path do
  #       with rails_env: fetch(:rails_env) do
  #         execute :rake, 'db:seed'
  #       end
  #     end
  #   end
  # end
  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'
end