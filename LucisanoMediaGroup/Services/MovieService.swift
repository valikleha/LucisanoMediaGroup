//
//  MovieService.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 20/11/22.
//

import Foundation


protocol MovieService {
    func fetchMovies(from endpoint: MovieListEndpoint) async throws -> [Movie]
    func fetchMovie(id: Int) async throws -> Movie
    func searchMovie(query: String) async throws -> [Movie]
    
}

enum MovieListEndpoint: String, CaseIterable {
    case thisWeek = "this_week"
    case trending
    case upcoming
    case comingSoon = "coming_soon"
    
    var description: String {
        switch self {
        case .thisWeek: return "This week"
        case .trending: return "Trending"
        case .upcoming: return "Upcoming"
        case .comingSoon: return "Coming soon"
        }
        
    }
}
enum MovieError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    var errorUserInfo: [String: Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}

