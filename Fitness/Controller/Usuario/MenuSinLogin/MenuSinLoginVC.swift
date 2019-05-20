//
//  MenuSinLoginVC.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 17/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit

class MenuSinLoginVC: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var perfilView: UIView!
    
    @IBOutlet weak var labelHome: UILabel!
    @IBOutlet weak var labelPerfil: UILabel!
    @IBOutlet weak var imageHome1: UIImageView!
    @IBOutlet weak var imagePerfil1: UIImageView!
    @IBOutlet weak var imageHome: UIImageView!
    @IBOutlet weak var imagePerfil: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var FeedTVC: UIViewController!
    var AsesoriaDetalleTVC: UIViewController!
    var PerfilVC: UIViewController!
    
    var viewControllers: [UIViewController]!
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboardFeed = UIStoryboard(name: "Feed", bundle: nil)
        FeedTVC = storyboardFeed.instantiateViewController(withIdentifier: "Feed")
        
        //let storyboardAsesoria = UIStoryboard(name: "Asesoria", bundle: nil)
        //AsesoriaDetalleTVC = storyboardAsesoria.instantiateViewController(withIdentifier: "Asesoria")
        
        //let storyboardProfile = UIStoryboard(name: "Profile", bundle: nil)
        //PerfilVC = storyboardProfile.instantiateViewController(withIdentifier: "Perfil")
        
        viewControllers = [FeedTVC]
    }
    
    @IBAction func didPressTab(_ sender: UIButton) {
        if sender.tag == 0{
            UIView.animate(withDuration: 0.5, delay: 0.1, options: [.repeat, .curveEaseOut, .autoreverse], animations: {
                self.homeView.layer.cornerRadius = 15
                self.homeView.layer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
                self.homeView.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
                self.imageHome.isHidden = true
                self.labelHome.isHidden = true
                self.imageHome1.isHidden = false
                
                self.perfilView.layer.cornerRadius = 15
                self.perfilView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.perfilView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.imagePerfil.isHidden = true
                self.labelPerfil.isHidden = false
                self.imagePerfil1.isHidden = false
            }) { (bool) in
                
            }
        }else{
            UIView.animate(withDuration: 0.5, delay: 0.1, options: [.repeat, .curveEaseOut, .autoreverse], animations: {
                self.perfilView.layer.cornerRadius = 15
                self.perfilView.layer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
                self.perfilView.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
                self.imagePerfil.isHidden = true
                self.labelPerfil.isHidden = true
                self.imagePerfil1.isHidden = false
                
                self.homeView.layer.cornerRadius = 15
                self.homeView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.homeView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.imageHome1.isHidden = true
                self.labelHome.isHidden = false
                self.imageHome.isHidden = false
            }) { (bool) in
                
            }
        }
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
    }
    
}
