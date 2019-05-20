//
//  ShowImagenVC.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 19/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
import Firebase

class ShowImagenVC: UIViewController {

    @IBOutlet weak var showImage: UIImageView!
    var feed: Feed!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.showImage.downloadImage(from: self.feed.imagen_feed)
    }

}
