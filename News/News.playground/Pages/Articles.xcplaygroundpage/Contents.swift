//: [Previous](@previous)

@testable import NewsUI

import UIKit
import PlaygroundSupport

let viewModel = ArticlesViewModel()
let viewController = ArticlesViewController(viewModel: viewModel)

PlaygroundPage.current.liveView = viewController.view

let (parent, _) = playgroundControllers(device: .p,uhone5_5inch, orientation: .portrait, child: viewController)

// Render the screen.
let frame = parent.view.frame
PlaygroundPage.current.liveView = parent
parent.view.frame = frame

//: [Next](@next)
