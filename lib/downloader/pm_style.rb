class PmStyle < EroGetter::Base
  name 'PM Style'
  url %r{http://mxserver08.net/new_pm/main/movie\d+.html}
  target "a > img" do |path|
    path.parent[:href] if path[:alt] =~ /file\d+/
  end
  sub_directory do
    matches = targets.first.match(/pm_(.+?)(\d+)[a|b|c].zip$/)
    "pm_#{matches[1]}_#{"%06d" % matches[2]}"
  end
end
