//: [Previous](@previous)

@testable import NewsFramework

import UIKit
import PlaygroundSupport

let interactor = ArticleListInteractor()

let viewController = ArticleListViewController(interactor: interactor)

PlaygroundPage.current.liveView = viewController.view

let (parent, _) = playgroundControllers(device: .phone4inch, orientation: .portrait, child: viewController)

// Render the screen.
let frame = parent.view.frame
PlaygroundPage.current.liveView = parent
parent.view.frame = frame

//: [Next](@next)
