//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Liam Potts on 1/22/23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        
        VStack {
            
            
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
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
            
        
            Spacer()
            
            Button ("Show Message"){
                
                let messages = ["You are awesome!", "You are great!", "You are the man!", "You are Fantastic!", "You make me smile!"]
                
                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastImageNumber
                messageString = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                var imageNumber: Int
                repeat{
                    imageNumber = Int.random(in: 0...messages.count-1)
                } while imageNumber == lastImageNumber
                
                imageName="image\(imageNumber)"
                lastImageNumber = imageNumber
                
            
                
                var soundNumber: Int
                repeat{
                    soundNumber = Int.random(in: 0...5)
                    
                } while soundNumber == lastSoundNumber
                
                lastSoundNumber = soundNumber
                let soundName = "sound\(soundNumber)"
                
                
                
                
                guard let soundFile = NSDataAsset(name: soundName) else{
                    print ("😡 Could not read file \(soundName)")
                    return
                }
                
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                    
                } catch{
                    print("😡 ERROR \(error.localizedDescription) creating audio player.")
                    
                }
                
                
                
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
