class PmStyle < EroGetter::Base
  name 'PM Style'
  url %r{http://mxserver08.net/new_pm/main/movie\d+.html}
  target 'a > img' do |path|
    path.parent[:href] if path.parent[:href] =~ /file=.+\.zip$/
  end
  sub_directory do
    matches = targets.first.match(/pm_(.+?)(\d+)[a|b|c].zip$/)
    format("pm_#{matches[1]}_%06d", matches[2])
  end
end
