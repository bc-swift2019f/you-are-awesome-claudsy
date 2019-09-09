//
//  ViewController.swift
//  You Are Awesome
//
//  Created by Claudia Yang on 8/26/19.
//  Copyright © 2019 Claudia Yang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var awesomeImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageIndex = -1
    var soundIndex = -1
    let numberOfImages = 3
    let numberOfSounds = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        //shows a message
        var newIndex: Int
        repeat {
            newIndex = Int.random(in: 0..<maxValue)
        } while lastNumber == newIndex
        return newIndex
    
    func playSound(soundName: String){
        if let sound = NSDataAsset(name: soundName){
            // check if sound.data is audio file
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
            } catch {
                //check if sound.data is not an audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound")
            }
        } else {
            print("ERROR: File \(soundName) didn't load :(")
        }
    }
        
    @IBAction func showMessagePressed(_ sender: UIButton) {
        
        let messages = ["You Are Awesome!",
        "You Are Great!",
        "You Are Amazing!",
        "You Are The Best!",
        "You Are So Cool!",
        "You Are The Pb To My J!",
        "I can't wait to download your app!"]
  
 
        //shows a message
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        //shows an image
        imageIndex = nonRepeatingRandom(lastNumber: imageIndex, maxValue: numberOfImages)
        awesomeImageView.image = UIImage(named: "image\(imageIndex)")
        
        //assigns number to each sound
        soundIndex = nonRepeatingRandom(lastNumber: soundIndex, maxValue: numberOfImages)
        
        //plays a sound
        let soundName = "sound\(soundIndex)"
        playSound(soundName: soundName)
        

        }
    }
}
