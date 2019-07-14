import UIKit
import NewsFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?

  private let navigationController = UINavigationController()
  private lazy var rootCoordinator = RootCoordinator(with: self.navigationController)
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    guard !Platform.isUnitTest else { return true }
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.backgroundColor = .white
    self.window = window

    rootCoordinator.start()

    window.rootViewController = navigationController
    window.makeKeyAndVisible()
    
    return true
  }
}
