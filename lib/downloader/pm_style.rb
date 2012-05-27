class PmStyle < EroGetter::Base
  name 'PM Style'
  url %r{http://mxserver08.net/new_pm/main/movie\d+.html}
  target "a > img" do |path|
    path.parent[:href] if path[:alt] =~ /file\d+/
  end
  sub_directory do
    targets.first.match(/pm_(.+)[a|b|c].zip$/)[1]
  end
end
