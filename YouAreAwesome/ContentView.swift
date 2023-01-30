//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Liam Potts on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = ""
    
    var body: some View {
        
        VStack {
            
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
            
        
            Button ("Show Message"){
                
                let message1 = "You Are Awesome!"
                let message2 = "You Are Great!"
                //action that happens when button is pressed
//                if messageString == message1 {
//                    messageString = message2
//                } else{
//                    messageString = message1
//                }
                
                messageString=(messageString == message1 ? message2 : message1)
                
            }
            .buttonStyle(.borderedProminent)
        }
        
        
    }
       
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
