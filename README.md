# News

An example native iOS and Android application exploring sharing architecture patterns.

While native iOS and Android applications require knowledge of different languages and frameworks, there are many things that are similiar. For example, many of the applications features will have similiar business logic and consume the same APIs.

My plan for these applications is to create a small pair of applications to use as a playground to test features and ideas.

## Application

Create a simple news application powered by [News API](https://newsapi.org/). 

## Plan

- Leverage functional power of Swift and Kotlin to create small, composable, and well-tested business logic.
- Model data as functional streams using [RxSwift](https://github.com/ReactiveX/RxSwift) and [RxKotlin](https://github.com/ReactiveX/RxKotlin).
- Create file and module naming and folder conventions to increase navigation between codebases.

## Project structure

- [iOS](ios/README.md) Application
- [Android](android/README.md) Application


## CI

[![CircleCI](https://circleci.com/gh/jPaolantonio/NewsApp.svg?style=svg)](https://circleci.com/gh/jPaolantonio/NewsApp)