//: [Previous](@previous)

import Foundation
import RxSwift

enum TestError: Error {
    case error
}

let disposeBag = DisposeBag()

Observable<String>.of("Hello")
Observable<String>.of("Hello", "World")
Observable<String>.error(TestError.error)
Observable<String>.never()
Observable<String>.empty()

let nicknames = Observable<String>
    .of("James", "Jim")

nicknames
    .filter { $0.count > 3}
    .subscribe(onNext: { print($0) })
    .disposed(by: disposeBag)

nicknames
    .map { $0.lowercased() }
    .subscribe(onNext: { print($0) })
    .disposed(by: disposeBag)

//: [Next](@next)
