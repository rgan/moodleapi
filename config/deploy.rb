require "bundler/vlad"

['dev', 'staging', 'production'].each do |name|
  desc "Set the target config to `#{name}'.rb"
  task(name) do
    load "./config/environments/#{name}.rb"
  end
end
