//
//  MenuConLoginVC.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 19/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit

class MenuConLoginVC: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var perfilView: UIView!
    @IBOutlet weak var asesoriaView: UIView!
    @IBOutlet weak var chatView: UIView!
    
    @IBOutlet weak var labelHome: UILabel!
    @IBOutlet weak var labelPerfil: UILabel!
    @IBOutlet weak var labelAsesoria: UILabel!
    @IBOutlet weak var labelChat: UILabel!
    
    @IBOutlet weak var imageHome: UIImageView!
    @IBOutlet weak var imagePerfil: UIImageView!
    @IBOutlet weak var imageAsesoria: UIImageView!
    @IBOutlet weak var imageChat: UIImageView!
    
    @IBOutlet weak var imageHomeEscondido: UIImageView!
    @IBOutlet weak var imagePerfilEscondido: UIImageView!
    @IBOutlet weak var imageAsesoriaEscondido: UIImageView!
    @IBOutlet weak var imageChatEscondido: UIImageView!
    
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
            self.imagePerfil.alpha = 0
            self.labelPerfil.alpha = 0
            self.imagePerfilEscondido.alpha = 1
            
            self.homeView.layer.cornerRadius = 15
            self.homeView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.homeView.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
            self.homeView.layer.borderWidth = 1.0
            self.imageHomeEscondido.alpha = 0
            self.labelHome.alpha = 1
            self.imageHome.alpha = 1
            
            self.chatView.layer.cornerRadius = 15
            self.chatView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.chatView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.chatView.layer.borderWidth = 1.0
            self.imageChat.alpha = 0
            self.labelChat.alpha = 0
            self.imageChatEscondido.alpha = 1
            
            self.asesoriaView.layer.cornerRadius = 15
            self.asesoriaView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.asesoriaView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.asesoriaView.layer.borderWidth = 1.0
            self.imageAsesoria.alpha = 0
            self.labelAsesoria.alpha = 0
            self.imageAsesoriaEscondido.alpha = 1
        }) { (bool) in
            
        }
    }
    
    @IBAction func btnAsesoria(_ sender: UIButton) {
        
        let vc = viewControllers[1]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        buttons[selectedIndex].isSelected = true
        
        UIView.animate(withDuration: 0.2, delay: 0.1, options: [.curveLinear], animations: {
            self.perfilView.layer.cornerRadius = 15
            self.perfilView.layer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
            self.perfilView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.perfilView.layer.borderWidth = 1.0
            self.imagePerfil.alpha = 0
            self.labelPerfil.alpha = 0
            self.imagePerfilEscondido.alpha = 1
            
            self.homeView.layer.cornerRadius = 15
            self.homeView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.homeView.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
            self.homeView.layer.borderWidth = 1.0
            self.imageHomeEscondido.alpha = 1
            self.labelHome.alpha = 0
            self.imageHome.alpha = 0
            
            self.chatView.layer.cornerRadius = 15
            self.chatView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.chatView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.chatView.layer.borderWidth = 1.0
            self.imageChat.alpha = 0
            self.labelChat.alpha = 0
            self.imageChatEscondido.alpha = 1
            
            self.asesoriaView.layer.cornerRadius = 15
            self.asesoriaView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.asesoriaView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.asesoriaView.layer.borderWidth = 1.0
            self.imageAsesoria.alpha = 1
            self.labelAsesoria.alpha = 1
            self.imageAsesoriaEscondido.alpha = 0
        }) { (bool) in
            
        }
    }
    
    @IBAction func btnPerfil(_ sender: UIButton) {
        
        let vc = viewControllers[2]
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
            self.labelPerfil.alpha = 1
            self.imagePerfilEscondido.alpha = 0
            
            self.homeView.layer.cornerRadius = 15
            self.homeView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.homeView.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
            self.homeView.layer.borderWidth = 1.0
            self.imageHomeEscondido.alpha = 1
            self.labelHome.alpha = 0
            self.imageHome.alpha = 0
            
            self.chatView.layer.cornerRadius = 15
            self.chatView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.chatView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.chatView.layer.borderWidth = 1.0
            self.imageChat.alpha = 0
            self.labelChat.alpha = 0
            self.imageChatEscondido.alpha = 1
            
            self.asesoriaView.layer.cornerRadius = 15
            self.asesoriaView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.asesoriaView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.asesoriaView.layer.borderWidth = 1.0
            self.imageAsesoria.alpha = 0
            self.labelAsesoria.alpha = 0
            self.imageAsesoriaEscondido.alpha = 1
        }) { (bool) in
            
        }
    }
    
    @IBAction func btnChat(_ sender: UIButton) {
        
        let vc = viewControllers[3]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        buttons[selectedIndex].isSelected = true
        
        UIView.animate(withDuration: 0.2, delay: 0.1, options: [.curveLinear], animations: {
            self.perfilView.layer.cornerRadius = 15
            self.perfilView.layer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
            self.perfilView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.perfilView.layer.borderWidth = 1.0
            self.imagePerfil.alpha = 0
            self.labelPerfil.alpha = 0
            self.imagePerfilEscondido.alpha = 1
            
            self.homeView.layer.cornerRadius = 15
            self.homeView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.homeView.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
            self.homeView.layer.borderWidth = 1.0
            self.imageHomeEscondido.alpha = 1
            self.labelHome.alpha = 0
            self.imageHome.alpha = 0
            
            self.chatView.layer.cornerRadius = 15
            self.chatView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.chatView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.chatView.layer.borderWidth = 1.0
            self.imageChat.alpha = 1
            self.labelChat.alpha = 1
            self.imageChatEscondido.alpha = 0
            
            self.asesoriaView.layer.cornerRadius = 15
            self.asesoriaView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.asesoriaView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.asesoriaView.layer.borderWidth = 1.0
            self.imageAsesoria.alpha = 0
            self.labelAsesoria.alpha = 0
            self.imageAsesoriaEscondido.alpha = 1
        }) { (bool) in
            
        }
    }
}
