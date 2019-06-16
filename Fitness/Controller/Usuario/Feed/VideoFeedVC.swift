//
//  VideoFeedVC.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 15/06/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoFeedVC: UIViewController {

    var feed: Feed!
    
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupVideo()
    }
    func setupVideo(){
        print("URL:\(self.feed.url_tipo)")
        let path = self.feed.url_tipo!
        
        let videoURL = URL(string: path)
        // Create an AVAsset
        let videoAsset = AVAsset(url: videoURL!)
        // Create an AVPlayerItem with asset
        let videoPlayerItem = AVPlayerItem(asset: videoAsset)
        // Initialize player with the AVPlayerItem instance.
        let player = AVPlayer(playerItem: videoPlayerItem)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.videoView.bounds
        self.videoView.layer.addSublayer(playerLayer)
        player.play()
    }

}
