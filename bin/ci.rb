# frozen_string_literal: true

# Run different build jobs and deal with the job results
class Build
  def initialize
    @results = {}
  end

  def run_job(job_name, command)
    puts heading("Running #{job_name}")
    @results[job_name] = system(command)
  end

  def heading(text)
    "\n\e[1;33m[Travis CI] #{text}\e[m\n"
  end

  def handle_results
    failures = @results.reject { |_, value| value }
    puts
    if failures.empty?
      puts 'Build finished successfully'
      exit(true)
    else
      puts "Build FAILED because of #{failures.map(&:first).join(', ')}"
      exit(false)
    end
  end
end

build = Build.new

if ENV['RUN'] == 'test'
  build.run_job('test', 'bundle exec rake spec')
  build.run_job('lint:haml', 'bundle exec rake lint:haml')
  build.run_job('lint:rubocop', 'bundle exec rake lint:rubocop')
end

build.handle_results
