Pod::Spec.new do |spec|

  spec.name         = "JJBHourMonitorSDK"
  spec.version      = "1.0.0"
  spec.summary      = "iOS建教帮学时监管SDK"

  # 描述
  spec.description  = <<-DESC
    iOS建教帮学时监管SDK。
  DESC

  # 项目主页
  spec.homepage     = "https://github.com/huangchangweng/JJBHourMonitorSDK"

  # 开源协议
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  # 作者
  spec.author       = { "黄常翁" => "599139419@qq.com" }
  
  # 支持平台
  spec.platform     = :ios, "9.0"

  # git仓库，tag
  spec.source       = { :git => "https://github.com/huangchangweng/JJBHourMonitorSDK.git", :tag => spec.version.to_s }
  
  # 自定义静态库SDK路径
  spec.vendored_frameworks = 'JJBHourMonitorSDK/JJBHourMonitorSDK/JJBHourMonitorSDK.framework'
  
  spec.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  
  # 资源文件目录，可以在此目录下存放图片、xib等资源，可以使用通配符或者{png,jpg,xib}这样的方式来指定文件类型
  spec.resource     = "JJBHourMonitorSDK/JJBHourMonitorSDK/JJBHourMonitorSDK.bundle"

  # 依赖系统库
  spec.frameworks   = "UIKit"

end
