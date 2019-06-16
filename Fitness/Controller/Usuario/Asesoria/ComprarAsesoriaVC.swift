//
//  ComprarAsesoriaVC.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 30/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit

class ComprarAsesoriaVC: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    var AsesoriaDetalleTVC: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboardAsesoria = UIStoryboard(name: "Asesoria", bundle: nil)
        AsesoriaDetalleTVC = (storyboardAsesoria.instantiateViewController(withIdentifier: "Asesoria") as! UINavigationController)
        // Do any additional setup after loading the view.
        
        let vc = AsesoriaDetalleTVC
        addChild(vc!)
        vc!.view.frame = contentView.bounds
        view.addSubview(vc!.view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

}
