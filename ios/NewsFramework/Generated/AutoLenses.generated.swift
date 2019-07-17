// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable variable_name

import Prelude

extension Article {
    enum lens {
        static let articleDescription = Lens<Article, String?>(
            get: { $0.articleDescription },
            set: { articleDescription, whole in
                Article(
                    articleDescription: articleDescription,
                    author: whole.author,
                    content: whole.content,
                    publishedAt: whole.publishedAt,
                    source: whole.source,
                    title: whole.title,
                    url: whole.url,
                    urlToImage: whole.urlToImage
                )
            }
        )
        static let author = Lens<Article, String?>(
            get: { $0.author },
            set: { author, whole in
                Article(
                    articleDescription: whole.articleDescription,
                    author: author,
                    content: whole.content,
                    publishedAt: whole.publishedAt,
                    source: whole.source,
                    title: whole.title,
                    url: whole.url,
                    urlToImage: whole.urlToImage
                )
            }
        )
        static let content = Lens<Article, String?>(
            get: { $0.content },
            set: { content, whole in
                Article(
                    articleDescription: whole.articleDescription,
                    author: whole.author,
                    content: content,
                    publishedAt: whole.publishedAt,
                    source: whole.source,
                    title: whole.title,
                    url: whole.url,
                    urlToImage: whole.urlToImage
                )
            }
        )
        static let publishedAt = Lens<Article, String?>(
            get: { $0.publishedAt },
            set: { publishedAt, whole in
                Article(
                    articleDescription: whole.articleDescription,
                    author: whole.author,
                    content: whole.content,
                    publishedAt: publishedAt,
                    source: whole.source,
                    title: whole.title,
                    url: whole.url,
                    urlToImage: whole.urlToImage
                )
            }
        )
        static let source = Lens<Article, Source>(
            get: { $0.source },
            set: { source, whole in
                Article(
                    articleDescription: whole.articleDescription,
                    author: whole.author,
                    content: whole.content,
                    publishedAt: whole.publishedAt,
                    source: source,
                    title: whole.title,
                    url: whole.url,
                    urlToImage: whole.urlToImage
                )
            }
        )
        static let title = Lens<Article, String>(
            get: { $0.title },
            set: { title, whole in
                Article(
                    articleDescription: whole.articleDescription,
                    author: whole.author,
                    content: whole.content,
                    publishedAt: whole.publishedAt,
                    source: whole.source,
                    title: title,
                    url: whole.url,
                    urlToImage: whole.urlToImage
                )
            }
        )
        static let url = Lens<Article, String?>(
            get: { $0.url },
            set: { url, whole in
                Article(
                    articleDescription: whole.articleDescription,
                    author: whole.author,
                    content: whole.content,
                    publishedAt: whole.publishedAt,
                    source: whole.source,
                    title: whole.title,
                    url: url,
                    urlToImage: whole.urlToImage
                )
            }
        )
        static let urlToImage = Lens<Article, String?>(
            get: { $0.urlToImage },
            set: { urlToImage, whole in
                Article(
                    articleDescription: whole.articleDescription,
                    author: whole.author,
                    content: whole.content,
                    publishedAt: whole.publishedAt,
                    source: whole.source,
                    title: whole.title,
                    url: whole.url,
                    urlToImage: urlToImage
                )
            }
        )
    }
}
extension Source {
    enum lens {
        static let id = Lens<Source, String>(
            get: { $0.id },
            set: { id, whole in
                Source(
                    id: id,
                    name: whole.name,
                    description: whole.description,
                    url: whole.url,
                    category: whole.category,
                    language: whole.language,
                    country: whole.country
                )
            }
        )
        static let name = Lens<Source, String>(
            get: { $0.name },
            set: { name, whole in
                Source(
                    id: whole.id,
                    name: name,
                    description: whole.description,
                    url: whole.url,
                    category: whole.category,
                    language: whole.language,
                    country: whole.country
                )
            }
        )
        static let description = Lens<Source, String>(
            get: { $0.description },
            set: { description, whole in
                Source(
                    id: whole.id,
                    name: whole.name,
                    description: description,
                    url: whole.url,
                    category: whole.category,
                    language: whole.language,
                    country: whole.country
                )
            }
        )
        static let url = Lens<Source, String>(
            get: { $0.url },
            set: { url, whole in
                Source(
                    id: whole.id,
                    name: whole.name,
                    description: whole.description,
                    url: url,
                    category: whole.category,
                    language: whole.language,
                    country: whole.country
                )
            }
        )
        static let category = Lens<Source, String>(
            get: { $0.category },
            set: { category, whole in
                Source(
                    id: whole.id,
                    name: whole.name,
                    description: whole.description,
                    url: whole.url,
                    category: category,
                    language: whole.language,
                    country: whole.country
                )
            }
        )
        static let language = Lens<Source, String>(
            get: { $0.language },
            set: { language, whole in
                Source(
                    id: whole.id,
                    name: whole.name,
                    description: whole.description,
                    url: whole.url,
                    category: whole.category,
                    language: language,
                    country: whole.country
                )
            }
        )
        static let country = Lens<Source, String>(
            get: { $0.country },
            set: { country, whole in
                Source(
                    id: whole.id,
                    name: whole.name,
                    description: whole.description,
                    url: whole.url,
                    category: whole.category,
                    language: whole.language,
                    country: country
                )
            }
        )
    }
}
