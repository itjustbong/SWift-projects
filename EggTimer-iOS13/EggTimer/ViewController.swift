//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft": 5, "Medium" : 7, "Hard" : 12]
    var fullCounter = 0;
    var counter = 0;
    var timer = Timer();
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleCounter: UILabel!
    @IBOutlet weak var counterProgressbar: UIProgressView!
    
    @objc func updateCounter() {
        //example functionality
        counterProgressbar.progress = Float((Double(fullCounter - counter) / Double(fullCounter)))
        if counter > 0 {
            titleCounter.text = "\(counter) seconds to the end of the world";
            counter -= 1
        }else{
            timer.invalidate()
            titleCounter.text = "Done"
            // 음악 재생
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        counter = eggTimes[hardness]!
        fullCounter = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
}
