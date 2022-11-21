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
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            ScrollView {
            
           
                ZStack {
                   
//                    Circle()
//                        .foregroundColor(Color("backgroundColor"))
//                        .blur(radius: 100)
//                        .offset(x: 0, y: 150)
           
                        
                        Image("black-adam-image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: .infinity, alignment: .top)
                                 
                    VStack {
                        
                        LinearGradient (colors: gradient, startPoint: .top, endPoint: .bottom)
                            .frame(height: 350)
                            .padding(.top, 200)
                          
                    }
                    
                    VStack (spacing: 0) {
                        Text ("Black Adam")
                            .font(Fonts.movieHeadline)
                            .foregroundColor(.white)
                            .padding(.top, 410)
                        Text ("2022")
                            .font(Fonts.movieSubtitle)
                            .foregroundColor(.white)
                        
                        HStack (spacing: 3) {
                            
                            Text ("Action,")
                                .font(Fonts.movieSubtitle)
                                .foregroundColor(.white)
                     
                            Text ("Adventure")
                                .font(Fonts.movieSubtitle)
                                .foregroundColor(.white)
                           
                        }
                        
                  
                        Text ("Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.")
                            .font(Fonts.description)
                            .foregroundColor(.white)
                            .offset(y: 10)
                            .padding()
                        //.padding(.top, 10)
                    }
                    
                    
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
                
                }
              
            }
            .background(Color(.black))
        .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
                
                    if(value.startLocation.x < 10 && value.translation.width > 100) {
                        self.mode.wrappedValue.dismiss()
                    }
                    
                }))
        
       
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView().preferredColorScheme(.light)
    }
}
