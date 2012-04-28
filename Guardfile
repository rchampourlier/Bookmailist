#guard 'bundler' do
#  watch('Gemfile')
  # Uncomment next line if Gemfile contain `gemspec' command
  # watch(/^.+\.gemspec/)
#end

guard 'shotgun' do
  watch(%r{^app/(.)*.rb})
end

guard 'rspec', :version => 2, :cli => "--color --format nested --require spec_helper" do
  watch(%r{^spec/(.+)_spec\.rb$})	{ |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^config/boot\.rb$})		{ "spec" }
  watch(%r{^app/(.+)\.rb$})     	{ "spec/app" }
  watch(%r{^lib/(.+)\.rb$})     	{ "spec/lib" }
  watch('spec/spec_helper.rb')  	{ "spec" }
end