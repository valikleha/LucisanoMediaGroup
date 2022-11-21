//
//  SearchView.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 18/11/22.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(Color("backgroundColor"))
                .blur(radius: 200)
                .offset(x: 0, y: -100)
            VStack{
                Text("Search")
                    .font(Fonts.headline)
                    .padding(.top, 30)
                    .tracking(-0.41)
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().preferredColorScheme(.dark)
    }
}
