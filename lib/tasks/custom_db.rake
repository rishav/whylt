namespace :db do
  desc "running and testing rake task"
  task :create_and_migrate do
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
  end
end