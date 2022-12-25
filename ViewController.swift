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
    
    let eggTimes = ["Soft": 5, "Medium":8, "Hard":12]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var TextChange: UILabel!
    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0
        secondsPassed = 0
        TextChange.text = hardness
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil,
                             repeats: true)}
    
        @objc func updateTimer (){
            if secondsPassed < totalTime {
                secondsPassed+=1
                let percentageProgress = Float(secondsPassed) / Float(totalTime)
                progressBar.progress = percentageProgress
            
                
             
                
            }
                else{
                TextChange.text = "Done!"
                    playSound()
                }
                
                func playSound() {
                    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    player = try! AVAudioPlayer(contentsOf: url!)
                    player.play()
            }
        }
    }
    
    
    
    

