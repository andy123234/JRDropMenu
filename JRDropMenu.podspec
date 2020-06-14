Pod::Spec.new do |s|
    s.name         = 'JRDropMenu'
    s.version      = '1.0.0'
    s.summary      = 'JRDropMenu是一款可高自定义的声明式下拉菜单控件'
    s.description  = <<-DESC
***
## Features:
1. 支持iOS9+.
2. 声明式构建.
3. 自定义标题和列表属性.
4. 根据内容自适应标题位置。  
***
                   DESC
    s.homepage     = 'https://github.com/andy123234/JRDropMenu'
    s.license      = { :type => "MIT", :file => 'LICENSE' }
    s.authors      = {'An An' => '736577528@qq.com'}
    s.platform     = :ios, '9.0'
    s.source       = {:git => 'https://github.com/andy123234/JRDropMenu.git', :tag => s.version}
    s.social_media_url = 'https://github.com/andy123234/JRDropMenu'
    s.source_files = 'JRDropMenuDemo/JRDropMenu/*.{h,m}'
    #s.resource_bundles    = { 'AAChartKitLib' => 'AAChartKitLib/AAJSFiles.bundle' }
    s.prefix_header_contents = '#import "JRGlobalMacro.h"'
    s.requires_arc = true
    s.ios.frameworks = 'UIKit'
    s.ios.deployment_target = '9.0'
  end
