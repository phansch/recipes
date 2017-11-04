namespace :lint do
  desc 'Run Haml Linting'
  task :haml do
    system('bundle exec haml-lint app/views')
  end

  desc 'Run rubocop lints'
  task :rubocop do
    system('bundle exec rubocop')
  end
end

task :lint do
  Rake::Task['lint:haml'].invoke
  Rake::Task['lint:rubocop'].invoke
end
