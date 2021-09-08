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
   
    var player: AVAudioPlayer!
    let eggTimes = ["Soft":3, "Medium":100, "Hard":720]
  var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton)
    {
       
        timer.invalidate()
        let hardness: String = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        titleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0,target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
       
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime{
            secondsPassed += 1
            let percentageProgress: Float =  Float (secondsPassed)  / Float (totalTime)
            progressBar.progress = percentageProgress
        
            
        } else{
            timer.invalidate()
            playSound()
            titleLabel.text = "DONE!"
    
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}
