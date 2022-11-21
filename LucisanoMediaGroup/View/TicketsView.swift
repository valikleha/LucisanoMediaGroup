//
//  TicketsView.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 18/11/22.
//

import SwiftUI

struct TicketsView: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color("backgroundColor"))
                .blur(radius: 100)
                .offset(x: 0, y: -100)
            VStack{
                Text("Tickets")
                    .font(Fonts.headline)
                    .padding(.top, 30)
                   
                Spacer()
            }
        }
    }
}

struct TicketsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketsView().preferredColorScheme(.dark)
    }
}
