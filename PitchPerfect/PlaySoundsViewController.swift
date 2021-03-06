//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Ahmed El Bialy on 2016-04-30.
//  Copyright © 2016 Ahmed El Bialy. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton:UIButton!
    @IBOutlet weak var chipmunkButton:UIButton!
    @IBOutlet weak var rabbitButton:UIButton!
    @IBOutlet weak var vaderButton:UIButton!
    @IBOutlet weak var echoButton:UIButton!
    @IBOutlet weak var reverbButton:UIButton!
    @IBOutlet weak var stopButton:UIButton!
    
    var recirdedAudioURL:URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int { case slow = 0, fast, chipmunk, vader, echo, reverb}
    
    @IBAction func playSoundForButton(_ sender:UIButton){
        print("Play sound button pressed")
        switch (ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender:AnyObject){
        print("Stop Audio Button Pressed")
        stopAudio()
    }
    
    var recordedAudioURL: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("PlaySoundsViewController loaded")
        setupAudio()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

    }
 
     */
}
