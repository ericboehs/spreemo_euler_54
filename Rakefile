require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = %w(lib)
  t.warning = false
  t.test_files = FileList['test/**/*_test.rb']
end

task default: %w(test)
