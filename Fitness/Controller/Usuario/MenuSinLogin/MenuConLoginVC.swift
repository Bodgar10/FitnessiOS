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

    @IBAction func didPressTab(_ sender: UIButton) {
        if sender.tag == 0{
            UIView.animate(withDuration: 0.5, delay: 0.1, options: [.repeat, .curveEaseOut, .autoreverse], animations: {
                self.homeView.layer.cornerRadius = 15
                self.homeView.layer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
                self.homeView.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
                self.imageHome.isHidden = true
                self.labelHome.isHidden = true
                self.imageHomeEscondido.isHidden = false
                
                self.perfilView.layer.cornerRadius = 15
                self.perfilView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.perfilView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.imagePerfil.isHidden = true
                self.labelPerfil.isHidden = false
                self.imagePerfilEscondido.isHidden = false
                
                self.chatView.layer.cornerRadius = 15
                self.chatView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.chatView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.imageChat.isHidden = true
                self.labelChat.isHidden = false
                self.imageChatEscondido.isHidden = false
                
                self.asesoriaView.layer.cornerRadius = 15
                self.asesoriaView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.asesoriaView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.imageAsesoria.isHidden = true
                self.labelAsesoria.isHidden = false
                self.imageAsesoriaEscondido.isHidden = false
            }) { (bool) in
                
            }
        }else if sender.tag == 2{
            UIView.animate(withDuration: 0.5, delay: 0.1, options: [.repeat, .curveEaseOut, .autoreverse], animations: {
                self.perfilView.layer.cornerRadius = 15
                self.perfilView.layer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
                self.perfilView.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
                self.imagePerfil.isHidden = true
                self.labelPerfil.isHidden = true
                self.imagePerfilEscondido.isHidden = false
                
                self.homeView.layer.cornerRadius = 15
                self.homeView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.homeView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.imageHomeEscondido.isHidden = true
                self.labelHome.isHidden = false
                self.imageHome.isHidden = false
                
                self.asesoriaView.layer.cornerRadius = 15
                self.asesoriaView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.asesoriaView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.imageAsesoriaEscondido.isHidden = true
                self.labelAsesoria.isHidden = false
                self.imageAsesoria.isHidden = false
                
                self.chatView.layer.cornerRadius = 15
                self.chatView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.chatView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.imageChatEscondido.isHidden = true
                self.labelChat.isHidden = false
                self.imageChat.isHidden = false
            }) { (bool) in
                
            }
        }else if sender.tag == 1{
            self.asesoriaView.layer.cornerRadius = 15
            self.asesoriaView.layer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
            self.asesoriaView.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
            self.imageAsesoria.isHidden = true
            self.labelAsesoria.isHidden = true
            self.imageAsesoriaEscondido.isHidden = false
            
            self.homeView.layer.cornerRadius = 15
            self.homeView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.homeView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.imageHomeEscondido.isHidden = true
            self.labelHome.isHidden = false
            self.imageHome.isHidden = false
            
            self.perfilView.layer.cornerRadius = 15
            self.perfilView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.perfilView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.imagePerfilEscondido.isHidden = true
            self.labelPerfil.isHidden = false
            self.imagePerfil.isHidden = false
            
            self.chatView.layer.cornerRadius = 15
            self.chatView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.chatView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.imageChatEscondido.isHidden = true
            self.labelChat.isHidden = false
            self.imageChat.isHidden = false
        }else{
            self.chatView.layer.cornerRadius = 15
            self.chatView.layer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
            self.chatView.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
            self.imageChat.isHidden = true
            self.labelChat.isHidden = true
            self.imageChatEscondido.isHidden = false
            
            self.homeView.layer.cornerRadius = 15
            self.homeView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.homeView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.imageHomeEscondido.isHidden = true
            self.labelHome.isHidden = false
            self.imageHome.isHidden = false
            
            self.perfilView.layer.cornerRadius = 15
            self.perfilView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.perfilView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.imagePerfilEscondido.isHidden = true
            self.labelPerfil.isHidden = false
            self.imagePerfil.isHidden = false
            
            self.asesoriaView.layer.cornerRadius = 15
            self.asesoriaView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.asesoriaView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.imageAsesoriaEscondido.isHidden = true
            self.labelAsesoria.isHidden = false
            self.imageAsesoria.isHidden = false
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
