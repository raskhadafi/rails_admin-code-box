rule(/^version:bump:.*/) do |t|
  require "time"

  bump_version_text           = "Bump version to"
  index                       = %w[major minor patch].index(t.name.split(':').last)
  file                        = 'lib/rails_admin/code/box/version.rb'
  version_file                = File.read(file)
  old_version, *version_parts = version_file.match(/(\d+)\.(\d+)\.(\d+)/).to_a
  version_parts[index]        = version_parts[index].to_i + 1
  version_parts[2]            = 0 if index < 2
  version_parts[1]            = 0 if index < 1
  new_version                 = version_parts * '.'

  sh "git status | grep 'nothing to commit'" # ensure we are not dirty
  File.open(file,'w') { |f| f.write(version_file.sub(old_version, new_version)) }
  sh "rake install && bundle && git add #{file} && NO_SYNTAX_CHECK=true git commit -m '#{bump_version_text} #{new_version}' && git tag version-#{new_version} && git push && git push --tags"
end
