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
    
    let eggTimes = ["Soft" : 5, "Medium" : 8, "Hard" : 12]
    var softCounter = 5
    var mediumCounter = 420
    var hardCounter = 720
    @IBOutlet weak var progressBar: UIProgressView!
    var timer = Timer()
    var progressBarCounter: Float = 1.0
    var player: AVAudioPlayer!
    
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        let hardness = sender.currentTitle!

        timer.invalidate() // just in case this button is tapped multiple times

        // start the timer
        if hardness == "Soft"{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerActionSoft), userInfo: nil, repeats: true)
        }
        else if hardness == "Medium"{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerActionMedium), userInfo: nil, repeats: true)
        }
        else if hardness == "Hard" {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerActionHard), userInfo: nil, repeats: true)
        }
        
    }
            
        @objc func timerActionSoft() {
            progressBar.progress = Float(progressBarCounter/5)
            progressBarCounter += 1.0
            softCounter -= 1
            print(softCounter)
            if softCounter == 0 {
                timer.invalidate()
                softCounter = 5
                infoLabel.text = "Done"
                progressBarCounter = 0
                playSound()
            }
        }
        @objc func timerActionMedium() {
            progressBar.progress = Float(progressBarCounter/420)
            progressBarCounter += 1.0
            mediumCounter -= 1
            print(mediumCounter)
            if mediumCounter == 0 {
                timer.invalidate()
                mediumCounter = 420
                infoLabel.text = "Done"
                progressBarCounter = 0
                playSound()
            }
        }
        @objc func timerActionHard() {
            progressBar.progress = Float(progressBarCounter/720)
            progressBarCounter += 1.0
            hardCounter -= 1
            print(hardCounter)
            if hardCounter == 0 {
                timer.invalidate()
                hardCounter = 720
                infoLabel.text = "Done"
                progressBarCounter = 0
                playSound()
            }
        }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    }


