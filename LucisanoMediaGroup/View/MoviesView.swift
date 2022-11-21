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
                        .padding(.bottom, 10)
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack (spacing: 15) {
                            ForEach (self.movies) {  movie in
                                //NavigationLink {
                                //DetailView()
                                //} label: {
                                MovieCardView(movie: movie)
                                    .frame(width: 140, height: 200)
                                
                            }
                        }
                        .offset(x: 20)
                        .padding(.trailing, 40)
                    }
                    
                    
                    
                }
                VStack (alignment: .leading, spacing: 0){
                    Text("Genres")
                        .font(Fonts.categories)
                        .padding(.leading, 20)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack (spacing: 15) {
                            ForEach (genres.indices, id: \.self) { index in
                                NavigationLink {
                                    DetailView()
                                } label: {
                                    Image(genres[index])
                                        .resizable()
                                    
                                        .aspectRatio(16/9, contentMode: .fit)
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
                    .padding(.bottom, 10)
                
                ScrollView (.horizontal, showsIndicators: false){
                    HStack (spacing: 15) {
                        ForEach (posters.indices, id: \.self) { index in
                            NavigationLink {
                                DetailView()
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
                                DetailView()
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
                   
                }   .frame(maxWidth: .infinity)
                
                
                    .padding(.bottom, 20)
                
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
            VStack (spacing: -2){
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
                
                Image("multicinema")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8)
                    .frame(height: 100)
                    .padding(.top, 20)
                Text ("Multicinema Modernissimo")
                    .font(Fonts.movieTitle)
                    .padding(.top, 15)
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
            MoviesView(title: "Latest", movies: Movie.stubbedMovies).preferredColorScheme(.light)
            MoviesView(title: "Latest", movies: Movie.stubbedMovies).preferredColorScheme(.dark)
        }
    }

