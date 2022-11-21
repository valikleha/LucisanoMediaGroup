//
//  TabBarIconView.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 18/11/22.
//

import SwiftUI

struct TabBarIconView: View {
    let width: CGFloat
    let height: CGFloat
    let iconName: String
    let tabName: String
    
    var body: some View {
        VStack {
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(Fonts.tabBar)
            Spacer()
        }
        .padding(.horizontal, -1)
    }
}

struct TabBarIconView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarIconView(width: 24, height: 24, iconName: "", tabName: "")
    }
}
