//
//  MoviesView.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 18/11/22.
//

import SwiftUI

struct MoviesView: View {
    
    @State var posters: [String] = ["wakanda-image", "black-adam-image", "wakanda-image", "black-adam-image"]
    @State var genres: [String] = ["action", "adventure", "comedy", "drama", "fantasy", "horror", "thriller"]
   @StateObject private var movieView = MovieHomeState()
    
    let title: String
    let movies: [Movie]
    var body: some View {
        ZStack{
            
            Circle()
                .foregroundColor(Color("backgroundColor"))
                .blur(radius: 100)
                .offset(x: 0, y: -100)
            ScrollView {
                getHeader()
                
                VStack (alignment: .leading, spacing: 0){
                    Text("This week")
                        .font(Fonts.categories)
                        .padding(.leading, 20)
                        .padding(.top, 10)
                        .padding(.bottom, 5)
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack (spacing: 20) {
                            ForEach (self.movies) {  movie in
                                NavigationLink {
                                    LazyView(
                                        DetailView(movieId: movie.id, movie: movie)
                                    )
                                } label: {
                                    MovieCardView(movie: movie)
                                        //.frame(width: 100, height: 200)
                                    
                                }
                            }
                            
                            .offset(x: 20)
                               
                        }
                        .padding(.trailing, 40)
                        
                        
                        
                    }
                    VStack (alignment: .leading, spacing: 0){
                        Text("Genres")
                            .font(Fonts.categories)
                            .padding(.leading, 20)
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                        
                        ScrollView (.horizontal, showsIndicators: false){
                            HStack (spacing: 10) {
                                ForEach (genres.indices, id: \.self) { movie in
                                    NavigationLink {
                                       
                                        
                                    } label: {
                                        Image(genres[movie])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 100)
                                            .cornerRadius(8)
                                    }
                                    
                                }
                            }
                            
                            .offset(x: 20)
                            .padding(.trailing, 40)
                            
                        }
                    }
                    VStack (alignment: .leading, spacing: 0){
                        Text("Trending")
                            .font(Fonts.categories)
                            .padding(.leading, 20)
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                        
                        ScrollView (.horizontal, showsIndicators: false){
                            HStack (spacing: 15) {
                                ForEach (posters.indices, id: \.self) { movie in
                                    NavigationLink {
//                                        LazyView(
//                                            DetailView(movieId: movie.id, movie: movie)
//                                        )
                                    } label: {
                                        Image(posters[movie])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 200)
                                            .cornerRadius(8)
                                    }
                                    
                                }
                            }
                            
                            .offset(x: 20)
                            .padding(.trailing, 40)
                            
                        }
                    }
                    VStack (alignment: .leading, spacing: 0){
                        Text("Coming soon")
                            .font(Fonts.categories)
                            .padding(.leading, 20)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                        
                        ScrollView (.horizontal, showsIndicators: false){
                            HStack (spacing: 15) {
                                ForEach (posters.indices, id: \.self) { index in
                                    NavigationLink {
                                       
                                    } label: {
                                        Image(posters[index])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 200)
                                            .cornerRadius(8)
                                    }
                                    
                                }
                            }
                            
                            .offset(x: 20)
                            .padding(.trailing, 40)
                            
                        }
                    }
                    .padding(.bottom, 25)
                }   .frame(maxWidth: .infinity)
                
                
                
                
            }
        }
    }
    
    
    @ViewBuilder
    func setCardProperties(text: String)-> some View {
        Text(text)
            .frame(width: 125, height: 60, alignment: .leading)
            .font(Fonts.movieTitle)
        
    }
    
    @ViewBuilder
    func getHeader() -> some View {
        VStack  {
            VStack (alignment: .center, spacing: -2){
                Text("Movies")
                    .font(Fonts.headline)
                    .padding(.top, 30)
                    .tracking(-0.41)
                
                HStack (spacing: 4) {
                    Text(currentMonth())
                        .font(Fonts.subTitle)
                        .tracking(-0.41)
                    Text(currentDay())
                        .font(Fonts.subTitle)
                        .tracking(-1)
                }
                
                
                //                HStack (alignment: .center) {
                //                    Image("multicinema")
                //                        .resizable()
                //                        .scaledToFit()
                //                        .cornerRadius(8)
                //                        .frame(height: 100)
                //                    .padding(.top, 20)
                //                    .padding(.leading, 45)
                //
                //                    Image(systemName: "arrowtriangle.down.square")
                //                        .font(.system(size: 24))
                //                        .padding(.top, 20)
                //
                //                }
                //                Text ("Multicinema Modernissimo")
                //                    .font(Fonts.movieTitle)
                //                    .padding(.top, 15)
                //                    .padding(.leading, 10)
                //                HStack (alignment: .center) {
                //                    Image("happy-maxicinema")
                //                        .resizable()
                //                        .scaledToFit()
                //                        .cornerRadius(8)
                //                        .frame(height: 100)
                //                    .padding(.top, 20)
                //                    .padding(.leading, 45)
                //
                //                    Image(systemName: "arrowtriangle.down.square")
                //                        .font(.system(size: 24))
                //                        .padding(.top, 20)
                //
                //                }
                //                Text ("Multicinema Modernissimo")
                //                    .font(Fonts.movieTitle)
                //                    .padding(.top, 15)
                //                    .padding(.leading, 10)
                HStack (alignment: .center) {
                    
                    Image("multicinema")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                        .frame(height: 100)
                        .padding(.top, 20)
                        .padding(.leading, 45)
                    
                    Image(systemName: "arrowtriangle.down.circle.fill")
                        .font(.system(size: 24))
                        .padding(.top, 25)
                        .padding(.leading, 5)
                    
                }
                
                
                
                Text ("Multicinema Modernissimo")
                    .font(Fonts.movieTitle)
                    .padding(.top, 15)
                    .padding(.leading, 10)
            }
        }
    }
    
    
    
    
    
    
    
    
    func currentMonth() -> String {
        let currentDate = Date()
        
        let nameFormatter = DateFormatter()
        nameFormatter.dateFormat = "MMMM"
        
        let name = nameFormatter.string(from: currentDate)
        
        return name
    }
    
    func currentDay() -> String {
        let currentDate = Date()
        
        let nameFormatter = DateFormatter()
        nameFormatter.dateFormat = "dd"
        
        let name = nameFormatter.string(from: currentDate)
        
        return name
    }
    
    
    struct MoviesView_Previews: PreviewProvider {
        static var previews: some View {
            //            MoviesView(title: "Latest", movies: Movie.stubbedMovies).preferredColorScheme(.light)
            MoviesView(title: "Latest", movies: Movie.stubbedMovies).preferredColorScheme(.dark)
        }
    }
    
}
