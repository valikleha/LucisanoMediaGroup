//
//  DetailView.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 18/11/22.
//

import SwiftUI

struct DetailView: View {
    @State var gradient = [Color(.black).opacity(0), Color(.black), Color(.black), Color(.black)]
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    let movieId: Int
    let movie: Movie
    let movieTitle: String
    let movieDescription: String
    @StateObject var imageLoader = ImageLoader()
    
    
    @StateObject private var movieDetailState = MovieDetailState()
    //@State private var selectedTrailerURL: URL?
   
    
    
    @Environment(\.dismiss) var dismiss
    var body: some View {

        NavigationView {
            ScrollView {
               
                
                ZStack {
                   
                    List {
                        if let image = imageLoader.image {
                            Image(uiImage: image)
                                .resizable()
                        }
                       
                    }
                  
                           
                        Image("black-adam-image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: .infinity, alignment: .top)
                    
                    VStack {
                        
                        LinearGradient (colors: gradient, startPoint: .top, endPoint: .bottom)
                            .frame(height: 350)
                            .padding(.top, 300)
                        
                    }
                    
                    
                    VStack (alignment: .center, spacing: 0) {
                        Text (movieTitle)
                            .font(Fonts.movieHeadline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                                        .padding(.top, 100)
                        HStack (alignment: .center, spacing: 10) {
                            Text("Action")
                                .font(Fonts.movieSubtitle)
                                .foregroundColor(.white)
                            Text ("2022")
                                .font(Fonts.movieSubtitle)
                                .foregroundColor(.white)
                           
                        }
                        .padding(.top, 10)
                    }
                    .padding(.top, 50)
                    
                    
                    
                    VStack (spacing: 0){
                        
                        Button {
                            self.mode.wrappedValue.dismiss()
                        } label: {
                            HStack {
                                Image(systemName: "chevron.backward.circle.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 50, leading: 30, bottom: 0, trailing: 0))
                            
                        }
                        
                        
                        
                    }
                    
                    .frame(maxHeight: .infinity, alignment: .top)
                    
                }
                
                
            }
            .background(Color(.black))
            .ignoresSafeArea()
//            .task(loadMovie)
//            .overlay(DataFetchPhaseOverlayView(phase: movieDetailState.phase, retryAction: loadMovie))
        }
        
        .navigationBarBackButtonHidden(true)
        
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
            
            if(value.startLocation.x < 10 && value.translation.width > 100) {
                self.mode.wrappedValue.dismiss()
            }
            
        }))
        
        
        
    }
   
    private func loadMovie() {
        Task { await self.movieDetailState.loadMovie(id: self.movieId) }
    }

}
struct MovieDetailListView: View {
       
    let movie: Movie
    var body: some View {
                movieDescriptionSection
    }
    private var movieDescriptionSection: some View {
        VStack (alignment: .center, spacing: 10){
            
            HStack (spacing: 10) {
                Text(movieGenreYearDurationText)
                    .font(Fonts.movieSubtitle)
                Text (movie.yearText)
                    .font(Fonts.movieSubtitle)
                    .foregroundColor(.white)
                .padding(.top, 10)
            }
            
                               
            
            Text (movie.overview)
                .font(Fonts.description)
                .foregroundColor(.white)
            
                .padding()
        }
        
    }
    private var movieGenreYearDurationText: String {
        "\(movie.genreText)"
    }
}




struct MovieDetailImage: View {
    @StateObject  var imageLoader = ImageLoader()
    let imageURL: URL
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: .infinity, alignment: .top)
                    
            }
        }
        .scaledToFit()
        .onAppear { imageLoader.loadImage(with: imageURL) }
        
    }
}

extension URL: Identifiable {
    
    public var id: Self { self }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movieId: Movie.stubbedMovie.id, movie: Movie.stubbedMovie, movieTitle: "Black Adam", movieDescription: Movie.stubbedMovie.overview).preferredColorScheme(.light)
    }
}
