//
//  MovieSection.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 23/11/22.
//

import Foundation

struct MovieSection: Identifiable {
    let id = UUID()
    let movies: [Movie]
    let endpoint: MovieListEndpoint
    var title: String {
        endpoint.description
    }
    var thumbnailType: MovieThumbnailType {
        endpoint.thumbnailType
    }
}

fileprivate extension MovieListEndpoint {
    var thumbnailType: MovieThumbnailType {
        switch self {
        case .thisWeek:
            return .poster()
        default:
            return .backdrop
        }
    }
}
