//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Liam Potts on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = "When the Genius Bar needs help, they call you!"
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(
                    Gradient(colors: [Color("SkyBlue"), .indigo])
                
                )
                .ignoresSafeArea()
            VStack {
                
                Text("You have skills!")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color("Gold-BC"))
                    .padding()
                    .background(Color("Maroon-BC"))
                    .cornerRadius(15)
                
                
                
                
                Spacer()
                Text(messageString)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.red)
                    .frame(height: 150)
                    .frame(maxWidth: .infinity)
    //                .border(.orange, width: 1)
                    .padding()
                //test comment
                
                Spacer()
                
                HStack{
                    
                    Button ("Awesome"){
                        //action that happens when button is pressed
                        messageString = "You Are Awesome!"
                    }
                    
                    .buttonStyle(.borderedProminent)
                    Spacer()
                        
                    
                    Button ("Great"){
                        //action that happens when button is pressed
                        messageString = "You Are Great!"
                    }
                    .buttonStyle(.borderedProminent)
                    
                    
                }
    //            .border(.purple,width: 5)
                .padding()
                
            }
        }
        
        
        
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
