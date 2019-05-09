//
//  ViewController.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 05/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import NVActivityIndicatorView

class PantallaPrincipalVC: UIViewController {

    @IBOutlet weak var iniciarSesionBtn: UIButton!
    @IBOutlet weak var registrarseBtn: UIButton!
    @IBOutlet weak var omitirBtn: UIButton!
    
    let SEGUE_LOGIN = "login"
    let SEGUE_REGISTRARSE = "registrarse"
    let SEGUE_OMITIR = "inicio"
    let SEGUE_ADMIN = "admin"
    
    var activityIndicator: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let uid = Auth.auth().currentUser?.uid{
            self.startActivityIndicator()
            BajarInfo.Instance.bajarUsuarios { (usuario) in
                if usuario.id_usuario == uid {
                    if usuario.tipo_usuario == Constantes.ADMIN{
                        self.endActivityIndicator()
                        let storyboard = UIStoryboard(name: "Admin", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: self.SEGUE_ADMIN)
                        let modalStyle: UIModalTransitionStyle = UIModalTransitionStyle.flipHorizontal
                        vc.modalTransitionStyle = modalStyle
                        self.present(vc, animated: true, completion: nil)
                    }else{
                        self.endActivityIndicator()
                        let storyboard = UIStoryboard(name: "Inicio", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: self.SEGUE_OMITIR)
                        let modalStyle: UIModalTransitionStyle = UIModalTransitionStyle.flipHorizontal
                        vc.modalTransitionStyle = modalStyle
                        self.present(vc, animated: true, completion: nil)
                    }
                    
                }
            }
            _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (tim) in
                self.endActivityIndicator()
            })
        }
        
    }

    @IBAction func iniciarSesionBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: self.SEGUE_LOGIN, sender: nil)
    }
    
    @IBAction func registrarseBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: self.SEGUE_REGISTRARSE, sender: nil)
    }
    
    @IBAction func omitirBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Inicio", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.SEGUE_OMITIR)
        let modalStyle: UIModalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        vc.modalTransitionStyle = modalStyle
        self.present(vc, animated: true, completion: nil)
    }
    
    func startActivityIndicator() {
        
        self.activityIndicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.activityIndicator.center = self.view.center
        self.activityIndicator.type = NVActivityIndicatorType.ballZigZag
        self.activityIndicator.color = #colorLiteral(red: 0.8392156863, green: 0.4196078431, blue: 0.6078431373, alpha: 1)
        self.view.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    func endActivityIndicator() {
        
        self.activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }

}

