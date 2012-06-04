begin
  require 'vlad'
  Vlad.load(:app => nil, :scm => "git")
rescue LoadError
  puts "Error loading Vlad"
end

desc 'vlad:deploy'
task "vlad:deploy" => %w[
  vlad:update vlad:bundle:install vlad:start_app vlad:cleanup
]

namespace :db do

  namespace :test do

    task :drop do
      puts "Dropping .."
      `mysql -u root -e "drop database moodle_test"`
    end

    task :create => :drop do
      puts "Creating .."
      `mysql -u root -e "create database moodle_test; GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle_test.* TO moodletest@localhost IDENTIFIED BY 'moodletest'"`
    end

    desc 'prepare test db'
    task :prepare => :create do
      puts "Creating schema .."
      `mysql -u moodletest -pmoodletest moodle_test < moodle_db.sql`
    end
  end

end

desc 'run specs'
task :spec do
  sh "rspec #{Dir.glob(File.join("spec", "**", "*_spec.rb")).join(" ")}"
end

# start_chrome.sh: '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' --new-window --user-data-dir=/tmp
#JSTESTDRIVER_JAR = "public/client/test/lib/jstestdriver/JsTestDriver.jar"
#namespace :jasmine do

#  desc 'start server'
#  task :start_server do
#    sh "java -jar #{JSTESTDRIVER_JAR} --port 9876 --browser './start_chrome.sh'" #--runnerMode DEBUG
#  end
#end