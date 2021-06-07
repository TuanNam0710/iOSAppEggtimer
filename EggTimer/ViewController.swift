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
    
    let eggTimes = [
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var progressPercentage: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressPercentage.progress = 0.0
        let hardness = sender.currentTitle!
        var secondsRemainding = eggTimes[hardness]!
        labelText.text = hardness
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemainding > 0 {
                secondsRemainding-=1
                print("\(secondsRemainding) seconds left.")
                self.progressPercentage.progress = Float(Double(self.eggTimes[hardness]!-secondsRemainding) / Double(self.eggTimes[hardness]!))
                
            } else {
                Timer.invalidate()
                self.labelText.text = "Done!"
                self.playsound()
            }
        }
    }
    func playsound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
