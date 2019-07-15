import Foundation

public struct SourcesResponse: Codable {
  let status: String
  let sources: [Source]
}
