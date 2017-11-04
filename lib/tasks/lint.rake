namespace :lint do
  desc 'Run Haml Linting'
  task :haml do
    system('bundle exec haml-lint app/views')
  end
end

task :lint do
  Rake::Task['lint:haml'].invoke
end
