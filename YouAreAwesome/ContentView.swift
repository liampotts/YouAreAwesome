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
    @State private var soundIsOn = true
    
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
            
            
            HStack{
                
                
                Text("Sound on: ")
                
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) { _ in
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                
                Spacer()
                
                Button ("Show Message"){
                    
                    let messages = ["You are awesome!", "You are great!", "You are the man!", "You are Fantastic!", "You make me smile!"]
                    
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                    messageString = messages[lastMessageNumber]
                    
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: 9)
                    imageName="image\(lastImageNumber)"
                    
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: 5)
                    playSound(soundName: "sound\(lastSoundNumber)")
                    
                    
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
    
    
    func playSound(soundName: String){
        
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
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
