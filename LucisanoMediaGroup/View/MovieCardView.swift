//
//  MovieCardView.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 21/11/22.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 130, height: 200)
                    if self.imageLoader.image != nil {
                        Image(uiImage: self.imageLoader.image!)
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
                self.imageLoader.loadImage(with: self.movie.posterURL)
        }
            
        }
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: Movie.stubbedMovie)
    }
}
