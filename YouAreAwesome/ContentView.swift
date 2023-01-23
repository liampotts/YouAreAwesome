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
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.red)
                .padding()
            //test comment
            
            HStack{
                
                Button ("Awesome"){
                    //action that happens when button is pressed
                    messageString = "You Are Awesome!"
                }
                .buttonStyle(.borderedProminent)
                
                Button ("Great"){
                    //action that happens when button is pressed
                    messageString = "You Are Great!"
                }
                .buttonStyle(.borderedProminent)
                
            }
            
            
        }
        
        
        
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
