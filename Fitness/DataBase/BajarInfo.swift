//
//  BajarInfo.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 09/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import Firebase
import FirebaseDatabase
import CoreData
import CoreLocation

class BajarInfo {
    
    private static let _instance = BajarInfo()
    
    static var Instance: BajarInfo {
        return _instance
    }
    
    func login(email_usuario: String, contrasena_usuario: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email_usuario, password: contrasena_usuario, completion: { (user, error) in
            if error != nil {
                completion(false)
            }else {
                completion(true)
            }
        })
    }
    
    func register(nombre_usuario: String, telefono_usuario: String, email_usuario: String, contrasena_usuario: String, foto_usuario: String, id_usuario: String, token_usuario: String, tipo_usuario: String, completion: @escaping (String) -> Void) {
        
        
        Auth.auth().createUser(withEmail: email_usuario, password: contrasena_usuario, completion: { (user, error) in
            
            if let firebaseError = error {
                completion(firebaseError.localizedDescription)
            }else if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest(){
                changeRequest.displayName = nombre_usuario
                changeRequest.commitChanges(completion: nil)
                
                SubirInfo.Instance.crearUsuario(nombre_usuario: nombre_usuario, telefono_usuario: telefono_usuario, email_usuario: email_usuario, contrasena_usuario: contrasena_usuario, foto_usuario: foto_usuario, id_usuario: Auth.auth().currentUser!.uid, token_usuario: token_usuario, tipo_usuario: tipo_usuario)
                
            }
        })
    }
    
    func bajarUsuarios(completion: @escaping (Usuarios) -> Void){
        SubirInfo.Instance.tablaUsuarios.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let nombre = data[Constantes.NOMBRE_USUARIO] as? String,
                    let telefono = data[Constantes.TELEFONO_USUARIO] as? String,
                    let email = data[Constantes.EMAIL_USUARIO] as? String{
                    if let contrasena = data[Constantes.CONTRASENA_USUARIO] as? String,
                        let foto = data[Constantes.FOTO_USUARIO] as? String,
                        let id_usuario = data[Constantes.ID_USUARIO] as? String{
                        if let token = data[Constantes.TOKEN_USUARIO] as? String,
                            let tipo = data[Constantes.TIPO_USUARIO] as? String {
                            completion(Usuarios(nombre_usuario: nombre, telefono_usuario: telefono, email_usuario: email, contrasena_usuario: contrasena, foto_usuario: foto, id_usuario: id_usuario, token_usuario: token, tipo_usuario: tipo))
                        }else{
                            print("USUARIO 4")
                        }
                    }else{
                        print("USUARIO 3")
                    }
                }else{
                    print("USUARIO 2")
                }
            }else{
                print("USUARIO 1")
            }
        }
    }

}
