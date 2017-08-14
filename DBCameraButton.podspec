Pod::Spec.new do |s|
  s.name             = 'DBCameraButton'
  s.version          = '1.0.0'
  s.summary          = 'Customizable, IB_DESIGNABLE, iOS style camera button.'
  s.description      = <<-DESC
                       Сamera button in the style of a standard iOS camera. Customizable, IB_DESIGNABLE. UIButton category (extension).
                       DESC

  s.homepage         = 'https://github.com/immago/DBCameraButton'
  s.screenshots      = 'https://user-images.githubusercontent.com/5740772/29002628-5ec56d38-7aaf-11e7-85a4-4810e918784f.gif'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.author           = { 'Dmitry Byankin' => 'the.immago@gmail.com' }
  s.source           = { :git => 'https://github.com/immago/DBCameraButton.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Classes/**/*'
end
