//
//  demo.swift
//  ship
//
//  Created by Eric Kingstonn on 24/06/2018.
//  Copyright © 2018 Eric Kingstonn. All rights reserved.
//

import Foundation
import UIKit
import AVKit

class demo: UIViewController{
    
    @IBAction func demo(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "art.scnassets/project", ofType: "mp4")
        {
            let video =  AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {video.play()})
        }
    }
    
}
