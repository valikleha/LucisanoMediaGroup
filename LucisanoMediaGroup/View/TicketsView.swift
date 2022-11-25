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
                .blur(radius: 200)
                .offset(x: 0, y: -100)
            VStack{
                Text("Tickets")
                    .font(Fonts.headline)
                    .padding(.top, 30)
                   
                Spacer()
                VStack{
                    VStack{
                     
                        Text("Black Adam")
                            .font(Fonts.ticketsName)
                    }.frame(width: 250, height: 600)
                        .offset(y: -210)
                      
                        .background(
                         
                            
                    Image("black-adam-image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    
                      
                        )
                    RoundedCornersShape(corners: [.topLeft, .bottomRight], radius: 15)
                        .foregroundColor(.white)
                    
                
                }
                .frame(height: 500)

                Image("barcode")
                    .resizable()
                    .frame(width: 250, height: 100)
                 
                    .scaledToFit()
                    .cornerRadius(10)
                  
                    .shadow(radius: 10)
                    .offset(y: -150)
                
            }
        }
    }
}



struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
        
    }
     

}


struct TicketsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketsView().preferredColorScheme(.dark)
    }
}
