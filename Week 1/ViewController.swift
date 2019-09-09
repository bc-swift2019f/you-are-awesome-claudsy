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
    
    @IBAction func showMessagePressed(_ sender: UIButton) {
        
        let messages = ["You Are Awesome!",
        "You Are Great!",
        "You Are Amazing!",
        "You Are The Best!",
        "You Are So Cool!",
        "You Are The Pb To My J!",
        "I can't wait to download your app!"]
  
        var newIndex: Int
        
        //shows an image
        repeat {
            newIndex = Int.random(in: 0..<messages.count)
        } while index == newIndex
        
        //shows a message
        index = newIndex
        messageLabel.text = messages[index]
        
        //shows an image
        repeat {
            newIndex = Int.random(in: 0..<numberOfImages)
        } while imageIndex == newIndex
        
        
        imageIndex = newIndex
        awesomeImageView.image = UIImage(named: "image\(imageIndex)")
        
        //assigns number to each sound
        repeat {
            newIndex = Int.random(in: 0..<numberOfSounds)
        } while soundIndex == newIndex
        
        soundIndex = newIndex
        
        //plays a sound
        var soundName = "sound\(soundIndex)"
        
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
        
    }

