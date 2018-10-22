//: [Previous](@previous)

@testable import NewsUI

import UIKit
import PlaygroundSupport

let article = Article(author: "Leonardo da Vinci",
                      title: "Lorem Ipsum Dolor",
                      description: "Suspendisse ornare felis ipsum, vitae viverra purus efficitur quis. Sed nibh lorem, interdum nec ultricies sit amet, condimentum non metus..",
                      source: Article.Source(id: "abc-news", name: "ABC News"))
let viewModel = ArticleViewModel(article: article)
let viewController = ArticleViewController(viewModel: viewModel)

PlaygroundPage.current.liveView = viewController.view

let (parent, _) = playgroundControllers(device: .phone5_5inch, orientation: .portrait, child: viewController)

// Render the screen.
let frame = parent.view.frame
PlaygroundPage.current.liveView = parent
parent.view.frame = frame


//: [Next](@next)
