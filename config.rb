require 'data_mapper'

configure :test do
  puts "Test...."
  DataMapper.setup(:default, 'mysql://moodletest:moodletest@localhost/moodle_test')
end

configure :development do
  puts "Development ..."
  DataMapper.setup(:default, 'mysql://moodleuser:moodle@localhost/moodle')
end
