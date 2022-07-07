import SwiftUI
import AVKit

enum soundOption: String {
    case am
    case water
}

class SoundManager {
    // this variable is for initilazing the instance one time, and avoiding the initialization everytime
    
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    func playSound(sound: soundOption) {
        guard let urlMusic = Bundle.main.url(
            forResource: sound.rawValue,
            withExtension: ".mp3")
        
        else { return }
        do {
            player = try AVAudioPlayer(contentsOf: urlMusic)
            player?.play()
        } catch let error {
            print("Error playing sound....\(error.localizedDescription)")
        }
    }
    
}

struct SoundeffectsBoot: View {
    var body: some View {
        VStack {
            Button("Play Sound 1") {
                SoundManager.instance.playSound(sound: .am)
            }
            .font(.largeTitle)
            .padding()
            .background(.green)
            .cornerRadius(20)
            
            Button("Play Sound 2") {
                SoundManager.instance.playSound(sound: .water)
            }
            .font(.largeTitle)
            .padding()
            .background(.gray)
            .cornerRadius(20)
            
        }
    }
}

struct SoundeffectsBoot_Previews: PreviewProvider {
    static var previews: some View {
        SoundeffectsBoot()
    }
}
