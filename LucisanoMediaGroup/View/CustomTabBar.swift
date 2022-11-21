//
//  CustomTabBar.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 17/11/22.
//

import SwiftUI

enum Tabs: Int {
    
    case movies
    case search
    case tickets
    case profile
    
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
      
        ZStack{
           
            VStack {
             
                       
                HStack(spacing: 65) {
                    tabButton(image: "movies-icon", tab: .movies, text: "Movies")
                    
                    tabButton(image: "search-icon", tab: .search, text: "Search")
                    tabButton(image: "tickets-icon", tab: .tickets, text: "Tickets")
                    
                    tabButton(image: "profile-icon", tab: .profile, text: "Profile")
                    
                }
                .padding(.top, 5)
                
                 .frame(maxWidth:.infinity)
                
                .frame(height: 55)
                
                
                .background(Color(colorScheme == .light ? .white : .black) .overlay(Rectangle().frame(width: nil, height: 0.2, alignment: .top).foregroundColor(Color.gray), alignment: .top).opacity(0.7).ignoresSafeArea())
               
                
                
            }
            
            
        }
                    
        
       
        
    }
    
    @ViewBuilder
    func tabButton(image: String, tab: Tabs, text: String)-> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack (alignment: .center, spacing: 5){
                Image(selectedTab == tab ? "\(image)-selected" : image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                Text(text)
                    .font(Fonts.tabBar)
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .opacity(selectedTab == tab ? 1 : 0.6)
            }
        }
    }
    
    
    
    struct CustomTabBar_Previews: PreviewProvider {
        static var previews: some View {
      // CustomTabBar(selectedTab: .constant(.movies)).preferredColorScheme(.light)
           ContentView()
            
        }
    }
    
}
