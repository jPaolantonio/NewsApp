//: [Previous](@previous)

@testable import NewsUI

import UIKit
import PlaygroundSupport

let article = Article.template
let presenter = ArticleDetailPresenter(article: article)
let viewController = ArticleDetailViewController(presenter: presenter)

PlaygroundPage.current.liveView = viewController.view

let (parent, _) = playgroundControllers(device: .phone4inch, orientation: .portrait, child: viewController)

// Render the screen.
let frame = parent.view.frame
PlaygroundPage.current.liveView = parent
parent.view.frame = frame


//: [Next](@next)
