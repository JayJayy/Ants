Pod::Spec.new do |s|
  s.name = 'Ants'
  s.version = '0.5.0'
  s.license = 'MIT'
  s.summary = 'A swifty async/await!'
  s.homepage = 'https://github.com/JayJayy/Ants'
  s.authors = { 'Johannes Starke' => 'johannesstarke@gmail.com' }
  s.source = { :git => 'https://github.com/JayJayy/Ants.git', :tag => s.version }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Ants/Ants/*.swift'
end
