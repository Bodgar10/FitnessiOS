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
    
    var viewControllers: [UINavigationController]!
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let storyboardFeed = UIStoryboard(name: "Feed", bundle: nil)
        FeedTVC = storyboardFeed.instantiateViewController(withIdentifier: "Feed")
        
        let storyboardAsesoria = UIStoryboard(name: "Asesoria", bundle: nil)
        AsesoriaDetalleTVC = storyboardAsesoria.instantiateViewController(withIdentifier: "Asesoria")
        
        //let storyboardProfile = UIStoryboard(name: "Profile", bundle: nil)
        //PerfilVC = storyboardProfile.instantiateViewController(withIdentifier: "Perfil")
        
        viewControllers = ([FeedTVC, AsesoriaDetalleTVC] as! [UINavigationController])
        
        let vc = viewControllers[0]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        buttons[selectedIndex].isSelected = true
        //didPressTab(buttons[selectedIndex])
        
    }
    
    @IBAction func buttonHome(_ sender: UIButton) {
        
        let vc = viewControllers[0]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        buttons[selectedIndex].isSelected = true
        
        UIView.animate(withDuration: 0.2, delay: 0.1, options: [.curveLinear], animations: {
            self.perfilView.layer.cornerRadius = 15
            self.perfilView.layer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
            self.perfilView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.perfilView.layer.borderWidth = 1.0
            self.imagePerfil.alpha = 1
            self.labelPerfil.alpha = 0
            self.imagePerfil1.alpha = 0
            
            self.homeView.layer.cornerRadius = 15
            self.homeView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.homeView.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
            self.homeView.layer.borderWidth = 1.0
            self.imageHome1.alpha = 0
            self.labelHome.alpha = 1
            self.imageHome.alpha = 1
        }) { (bool) in
            
        }
    }
    
    @IBAction func buttonAsesoria(_ sender: UIButton) {
        let vc = viewControllers[1]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        buttons[selectedIndex].isSelected = true
        
        UIView.animate(withDuration: 0.2, delay: 0.1, options: [.curveEaseInOut], animations: {
            self.perfilView.layer.cornerRadius = 15
            self.perfilView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.perfilView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.perfilView.layer.borderWidth = 1.0
            self.imagePerfil.alpha = 1
            self.labelPerfil.alpha = 0
            self.imagePerfil1.alpha = 0
            
            self.homeView.layer.cornerRadius = 15
            self.homeView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.homeView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.homeView.layer.borderWidth = 1.0
            self.imageHome1.alpha = 1
            self.labelHome.alpha = 0
            self.imageHome.alpha = 0
        }) { (bool) in
            
        }
    }
    
    @IBAction func buttonPerfil(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0.1, options: [.curveEaseOut], animations: {
            self.perfilView.layer.cornerRadius = 15
            self.perfilView.layer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
            self.perfilView.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
            self.perfilView.layer.borderWidth = 1.0
            self.imagePerfil.alpha = 0
            self.labelPerfil.alpha = 1
            self.imagePerfil1.alpha = 1
            
            self.homeView.layer.cornerRadius = 15
            self.homeView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.homeView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.homeView.layer.borderWidth = 1.0
            self.imageHome1.alpha = 1
            self.labelHome.alpha = 0
            self.imageHome.alpha = 0
        }) { (bool) in
            
        }
    }
    
}
