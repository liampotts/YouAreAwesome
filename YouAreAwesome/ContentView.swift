//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Liam Potts on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    
    
    var body: some View {
        
        VStack {
            
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
            
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
                
                let messages = ["You are awesome!", "You are great!", "You are the man!", "You are Fantastic!", "You make me smile!"]
                
                messageString = messages[Int.random(in: 0...messages.count-1)]
                
                messageNumber+=1
                
                if messageNumber==messages.count{
                    messageNumber=0
                }
                
                
                imageName="image\(Int.random(in: 0...9))"
                
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
