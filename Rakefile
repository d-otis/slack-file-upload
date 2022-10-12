require_relative "./config/environment"

task :console do
  Pry.start
end

task :c do
  Rake::Task[:console].invoke
  Rake::Task[:console].execute
end

def reload!
  load_all "./app"
end