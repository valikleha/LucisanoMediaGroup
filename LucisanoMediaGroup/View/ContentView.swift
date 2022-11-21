//
//  ContentView.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 16/11/22.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var selectedTab: Tabs = .movies
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    
    var body: some View {
     
        NavigationView {
            VStack (spacing: 0) {
                TabView(selection: $selectedTab) {
                    MoviesView(title: "Latest", movies: Movie.stubbedMovies)
                        .tag(Tabs.movies)
                    SearchView()
                        .tag(Tabs.search)
                    TicketsView()
                        .tag(Tabs.tickets)
                    ProfileView()
                        .tag(Tabs.profile)
                } 
                
                CustomTabBar(selectedTab: $selectedTab)
            }
            
            
            
            
            .preferredColorScheme(.dark)
            
        }
       
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
  
        //ContentView().preferredColorScheme(.light)
            ContentView().preferredColorScheme(.dark)
        
    }
}
