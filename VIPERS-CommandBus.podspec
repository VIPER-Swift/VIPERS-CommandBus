Pod::Spec.new do |s|
  s.name             = "VIPERS-CommandBus"
  s.version          = "0.1.0"
  s.summary          = "Command bus implementation used by the iOS application framework 'VIPERS'"

 s.description      = <<-DESC
 Command bus / message bus implementation used by VIPERS. The command bus is used to implement the interactor layer in the VIPERS ios application framework.
                       DESC

  s.homepage         = "https://github.com/VIPER-Swift/VIPERS-CommandBus"
  s.license          = 'MIT'
  s.author           = { "Jan Bartel" => "barteljan@yahoo.de" }
  s.source           = { :git => "https://github.com/VIPER-Swift/VIPERS-CommandBus.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'VIPERS-CommandBus' => ['Pod/Assets/*.png']
  }

  s.dependency 'VIPERS-CommandBus-Protocol'

end
