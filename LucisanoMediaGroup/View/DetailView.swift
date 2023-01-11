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
    @State var movie: Movie
    
    @StateObject var imageLoader = ImageLoader()
    
    
    
    @StateObject private var movieDetailState = MovieDetailState()
    //@State private var selectedTrailerURL: URL?
    
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        NavigationView {
         
            ZStack {
               
             
                    AsyncImage(url: movie.posterURL){image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    } placeholder: {
                        Color.black
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    //ScrollView (showsIndicators: false) {
                    ZStack {
                    VStack {
                        
                        LinearGradient (colors: gradient, startPoint: .top, endPoint: .bottom)
                            .frame(height: 750)
                            .padding(.top, 50)
                            .offset(y: -10)
                        
                    } .frame(maxHeight: .infinity, alignment: .bottom)
               
                        Circle()
                            .foregroundColor(Color("backgroundColor"))
                            .blur(radius: 140)
                            .frame(height: 400)
                            .offset(x: 0, y: 100)
                       
                        
                        Group{
                            VStack (alignment: .center, spacing: 0) {
                                Text (movie.title)
                                    .font(Fonts.movieHeadline)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                
                                
                                
                                
                                HStack (alignment: .center, spacing: 10) {
                                    Text ("2022")
                                        .font(Fonts.movieSubtitle)
                                    
                                        .foregroundColor(.white)
                                    Text("•")
                                        .font(Fonts.movieSubtitle)
                                        .foregroundColor(.white)
                                    Text("Action")
                                        .font(Fonts.movieSubtitle)
                                        .foregroundColor(.white)
                                    Text("•")
                                        .font(Fonts.movieSubtitle)
                                        .foregroundColor(.white)
                                    Text("2h 5m")
                                        .font(Fonts.movieSubtitle)
                                        .foregroundColor(.white)
                                    
                                    
                                }
                               
                              
                                    
                                    Text ("IMDB: 8.9/10")
                                        .font(Fonts.imdbDescription)
                                    
                                        .foregroundColor(.white)
                                    
                                     
                                    
                                
                                .padding(.top, 10)
                                
                                Text("Metacritic: 82%")
                                    .font(Fonts.imdbDescription)
                                    .foregroundColor(.white)
                                
                                Text("Rotten Tomatoes: 97%")
                                    .font(Fonts.imdbDescription)
                                .foregroundColor(.white)
                                
                                
                                Text (movie.overview)
                                    .frame(width: 350, height: 110)
                                    .font(Fonts.description)
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
                                    //.padding()
                               
                                
                                HStack (alignment: .center){
                                Text("November 23")
                                    .font(Fonts.dateDetail)
                                .foregroundColor(.white)
                                .padding(.leading, 23)
                                    Image("arrow")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 7)
                                 
                                    Spacer()
                                }
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack{
                                        Button(action: {
                                            print("Buy ticket")
                                        }, label: {
                                            Text("14:00")
                                                .font(Fonts.timeeDetail)
                                                .foregroundColor(.black)
                                                .frame(width: 80, height: 30)
                                                .background(Color.white)
                                                .tracking(-0.4)
                                            
                                            
                                                .cornerRadius(50)
                                            
                                        })
                                        Button(action: {
                                            print("Buy ticket")
                                        }, label: {
                                            Text("17:00")
                                                .font(Fonts.timeeDetail)
                                                .foregroundColor(.black)
                                                .frame(width: 80, height: 30)
                                                .background(Color.white)
                                                .tracking(-0.4)

                                            
                                            
                                                .cornerRadius(50)
                                            
                                        })
                                        Button(action: {
                                            print("Buy ticket")
                                        }, label: {
                                            Text("19:00")
                                                .font(Fonts.timeeDetail)
                                                .foregroundColor(.black)
                                                .frame(width: 80, height: 30)
                                                .background(Color.white)
                                                .tracking(-0.4)

                                            
                                            
                                                .cornerRadius(50)
                                            
                                        })
                                        Button(action: {
                                            print("Buy ticket")
                                        }, label: {
                                            Text("21:00")
                                                .font(Fonts.timeeDetail)
                                                .foregroundColor(.black)
                                                .frame(width: 80, height: 30)
                                                .background(Color.white)
                                                .tracking(-0.4)

                                            
                                            
                                                .cornerRadius(50)
                                            
                                        })
                                        
                                    }
                                    .offset(x: 25)
                                    .padding(.trailing, 50)
                                }
                          
                                .padding(.top, 10)
              
                               
                            }
                            .padding(.top, 150)
                            
                           
                          
                            
                        }
                       
                    }
                    .padding(.top, 60)
                    .padding(.bottom, 10)
                    
                    
              
                
              
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
                ZStack{

                    Rectangle()
                        
                        .foregroundColor(Color.black)
                        .blur(radius: 40)
                        .offset(x: 0, y: 50)
                        .frame(height: 100)
                   
                    VStack (){
                        Button(action: {
                            print("Buy ticket")
                        }, label: {
                            Text("Buy ticket")
                                .font(Fonts.buttonFont)
                                .foregroundColor(.black)
                                .frame(width: 200, height: 55)
                                .background(Color.white)
                            
                            
                                .cornerRadius(50)
                            
                        })
                    }
                    
                }
                
                .offset(y: 350)
                }
            
                
                
            
            .background(Color(.black))
            .ignoresSafeArea()
            
        }
        
        .navigationBarBackButtonHidden(true)
        
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
            
            if(value.startLocation.x < 20 && value.translation.width > 100) {
                self.mode.wrappedValue.dismiss()
            }
            
        }))
        
        
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
        DetailView(movieId: Movie.stubbedMovie.id, movie: Movie.stubbedMovie).preferredColorScheme(.light)
    }
}
