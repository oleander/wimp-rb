require "bundler/gem_tasks"

desc "Regenerates classes using thrift"
task :thrift do
  puts `thrift --gen rb -out lib/gen -v resources/thrift/services.thrift`
end