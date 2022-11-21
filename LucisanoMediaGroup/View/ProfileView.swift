//
//  ProfileView.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 18/11/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Text("Profile")
                .font(Fonts.headline)
                .padding(.top, 30)
        
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().preferredColorScheme(.dark)
    }
}
