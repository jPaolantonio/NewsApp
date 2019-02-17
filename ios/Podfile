platform :ios, '10.0'

inhibit_all_warnings!

target 'News' do
  use_frameworks!

  pod 'Moya/RxSwift'
  pod 'RxCocoa'
  pod 'RxDataSources'
  pod 'RxSwift'
  pod 'SnapKit'

  target 'NewsTests' do
    inherit! :search_paths

    pod 'Nimble'
    pod 'Quick'
  end
end

target 'NewsUI' do
  use_frameworks!

  pod 'Moya/RxSwift'
  pod 'RxCocoa'
  pod 'RxDataSources'
  pod 'RxSwift'
  pod 'SnapKit'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.2'
    end
  end
end
