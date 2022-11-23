//
//  MovieCardView.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 21/11/22.
//

import SwiftUI
enum MovieThumbnailType {
    case poster(showTitle: Bool = true)
    case backdrop
 
}
struct MovieCardView: View {

    let movie: Movie
    @StateObject var imageLoader = ImageLoader()
    var thumbnailType: MovieThumbnailType = .poster()
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                ZStack {
                    Rectangle()
                        .fill(Color.black.opacity(0.3))
                        .frame(width: 130, height: 200)
                    if let image = imageLoader.image {
                        Image(uiImage: image)
                            .resizable()
                    }
                  
                    
                }
              
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(8)
//                Text(movie.title)
//                    .font(Fonts.movieTitle)
                
            }
            //.lineLimit(1)
            .onAppear() {
                switch thumbnailType {
                case .poster:
                    imageLoader.loadImage(with: movie.posterURL)
                case .backdrop:
                    imageLoader.loadImage(with: movie.backdropURL)
                }
        }
            
        }
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: Movie.stubbedMovie)
    }
}
