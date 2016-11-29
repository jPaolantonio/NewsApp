import Foundation

struct Platform {
  static let isSimulator: Bool = {
    var isSim = false
    #if arch(i386) || arch(x86_64)
    isSim = true
    #endif
    return isSim
  }()

  static let isUnitTest: Bool = {
    // http://stackoverflow.com/a/29991529/178727
    // http://stackoverflow.com/a/36209407
    return ProcessInfo.processInfo.environment["XCInjectBundle"] != nil ||
      ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
  }()
}
