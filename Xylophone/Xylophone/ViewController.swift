import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        
        print("Start")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
            print("End")
        }
        
        let tune: String? = sender.currentTitle
        playSound(tune: tune)
    }
    
    func playSound(tune: String?) {
        if(tune == nil) {return}
        let url = Bundle.main.url(forResource: tune, withExtension: "wav")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
