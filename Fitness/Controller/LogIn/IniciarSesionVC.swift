//
//  IniciarSesionVC.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 09/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
import FirebaseAuth
import NVActivityIndicatorView
import Firebase

class IniciarSesionVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contrasenaTextField: UITextField!
    
    @IBOutlet weak var iniciarSesionView: UIView!
    @IBOutlet weak var registrarmeView: UIView!
    
    let SEGUE_REGISTRO = "registro"
    let SEGUE_OMITIR = "inicio"
    let SEGUE_ADMIN = "admin"
    
    var activityIndicator: NVActivityIndicatorView!
    
    var token = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.contrasenaTextField.delegate = self
        //self.nombreTextField.delegate = self
        //self.telefonoTextField.delegate = self
        self.hideKeyboardWhenTappingAround()
        
        if let tok = InstanceID.instanceID().token() {
            self.token = tok
        }
        
        var tap = UITapGestureRecognizer(target: self, action: #selector(self.ingresarBtn))
        self.iniciarSesionView.addGestureRecognizer(tap)
        self.iniciarSesionView.isUserInteractionEnabled = true
        
        tap = UITapGestureRecognizer(target: self, action: #selector(self.registrarmeBtn))
        self.registrarmeView.addGestureRecognizer(tap)
        self.registrarmeView.isUserInteractionEnabled = true
        
    }

    @objc func registrarmeBtn(){
        self.performSegue(withIdentifier: self.SEGUE_REGISTRO, sender: nil)
    }
    
    
    @objc func ingresarBtn(){
        if self.emailTextField.text == "" || self.contrasenaTextField.text == "" {
            self.alert(title: "Falta información", message: "Revisa que tengas todo escrito.")
        }else if let email = self.emailTextField.text, let contrasena = self.contrasenaTextField.text{
            self.startActivityIndicator()
            BajarInfo.Instance.login(email_usuario: email, contrasena_usuario: contrasena) { (isLogin) in
                if isLogin {
                    BajarInfo.Instance.bajarUsuarios { (usuario) in
                        if usuario.id_usuario == Auth.auth().currentUser!.uid {
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
                }else{
                    self.alert(title: "Hubo un error", message: "Intenta de nuevo más tarde.")
                }
            }
        }
    }
    
    func startActivityIndicator() {
        
        self.activityIndicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.activityIndicator.center = self.view.center
        self.activityIndicator.type = NVActivityIndicatorType.ballRotateChase
        self.activityIndicator.color = #colorLiteral(red: 0.737254902, green: 0, blue: 0.09803921569, alpha: 1)
        self.view.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    func endActivityIndicator() {
        
        self.activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}

extension IniciarSesionVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

