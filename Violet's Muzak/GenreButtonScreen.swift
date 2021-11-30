//
//  GenreButtonScreen.swift
//  Violet's Muzak
//
//  Created by Violet on 11/29/21.
//

import UIKit
import MediaPlayer




class GenreButtonScreen: UIViewController {
    
    @IBOutlet var doButtonRounded: UIButton!
    @IBOutlet weak var roundTheButton: UIButton!
    @IBOutlet weak var roundedRec: UIButton!
    @IBOutlet weak var roundTheStop: UIButton!
    @IBOutlet weak var roundTheNext: UIButton!
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doButtonRounded.layer.cornerRadius = 30
        roundTheButton.layer.cornerRadius = 30
        roundedRec.layer.cornerRadius = 30
        roundTheStop.layer.cornerRadius = 30
        roundTheNext.layer.cornerRadius = 30
    }
    
    func playGenre(genre: String){
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        print("Here \(sender.currentTitle!)")
        
        MPMediaLibrary.requestAuthorization{ (status) in
            if status == .authorized {
                DispatchQueue.main.async {
                    self.playGenre(genre: sender.currentTitle!)
                }
            }
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
}

//    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    @IBAction func genreButtonTapped(_ sender: UIButton) {
//        print("Here \(sender.currentTitle!)")
//
///       MPMediaLibrary.requestAuthorization { (status) in
//          if status == .authorized {
//                DispatchQueue.main.async {
//                   self.playGenre(genre: sender.currentTitle!)
//                }
//            }
//       }
//   }
//    @IBAction func stopButtonTapped(_ sender: UIButton) {
//        musicPlayer.stop()
//    }
//
//    @IBAction func nextButtonTapped(_ sender: UIButton) {
//        musicPlayer.skipToNextItem()
//    }
//    func playGenre(genre: String){
//        musicPlayer.stop()
//
//        let query = MPMediaQuery()
//        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
//
//        query.addFilterPredicate(predicate)
//
//        musicPlayer.setQueue(with: query)
//        musicPlayer.shuffleMode = .songs
//        musicPlayer.play()
//    }
