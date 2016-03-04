
Pod::Spec.new do |s|
  s.name     = "RXTableViewItem"
  s.version  = "0.5"
  s.license  = "MIT"
  s.summary  = "RXTableViewItem is a relate tableview items"
  s.homepage = "https://github.com/xzjxylophone/RXTableViewItem"
  s.author   = { 'Rush.D.Xzj' => 'xzjxylophoe@gmail.com' }
  s.social_media_url = "http://weibo.com/xzjxylophone"
  s.source   = { :git => 'https://github.com/xzjxylophone/RXTableViewItem.git', :tag => "v#{s.version}" }
  s.description = %{
        RXTableViewItem is a relate tableview items.
  }
  s.source_files = 'RXTableViewItem/*.{h,m}'
  s.frameworks = 'Foundation', 'UIKit'
  s.requires_arc = true
  s.platform = :ios, '5.0'

end




