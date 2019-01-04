//: [Previous](@previous)

@testable import NewsUI

import UIKit
import PlaygroundSupport
import Moya

let presenter = ArticleListPresenter()

let viewController = ArticleListViewController(presenter: presenter)

PlaygroundPage.current.liveView = viewController.view

let (parent, _) = playgroundControllers(device: .phone4inch, orientation: .portrait, child: viewController)

// Render the screen.
let frame = parent.view.frame
PlaygroundPage.current.liveView = parent
parent.view.frame = frame

//: [Next](@next)
















//let response: TopHeadlinesResponse = TopHeadlinesResponse.template
//let networking = Networking.makeStubbed(responseObject: response)
//let presenter = ArticleListPresenter(networking: networking)

//let networking = Networking.makeDelayedStubbed()
//let presenter = ArticleListPresenter(networking: networking)
