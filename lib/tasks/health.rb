if Rails.env.development? || Rails.env.test?
  def run_command(command, env = {})
    description = "Running '#{command}'"
    separator = '-' * description.length

    puts '', separator, description, separator, ''

    system(env, command) or fail "There was an error while running '#{command}'"
  end

  def run_rubycritic_command(args)
    rubycritic_opt = /o(pen)?\s?(rubycritic|r)?/
    rubycritic_flag = '--no-browser' if args.open_rubycritic !~ rubycritic_opt

    run_command "bundle exec rubycritic app lib #{rubycritic_flag}"
  end

  desc 'Checks app health: runs tests, security checks and rubocop'
  task :health, [:open_rubycritic] do |_t, args|
    args.with_defaults(open_rubycritic: '')

    run_command 'bundle exec bundle-audit update'
    run_command 'bundle exec bundle-audit check'
    run_command 'bundle exec brakeman -z'
    run_rubycritic_command(args)
    run_command 'bundle exec rubocop'
  end
end
