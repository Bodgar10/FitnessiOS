//
//  SubirInfo.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 08/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
/**/

class SubirInfo{
    
    private static let _instance = SubirInfo()
    
    static var Instance: SubirInfo {
        return _instance
    }
    
    var dbRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var tablaUsuarios: DatabaseReference{
        return dbRef.child(Constantes.TABLA_USUARIOS)
    }
    
    var tablaFeed: DatabaseReference{
        return dbRef.child(Constantes.TABLA_FEED)
    }

    func crearFeed(tipo_feed: String, is_gratis: Bool, imagen_feed: String, costo_pdf: String, url_tipo: String,timestamp: String, descripcion: String){
        let data: [String:Any] = [Constantes.TIPO_FEED: tipo_feed,
                                  Constantes.IS_GRATIS: is_gratis,
                                  Constantes.IMAGEN_FEED: imagen_feed,
                                  Constantes.COSTO_PDF: costo_pdf,
                                  Constantes.URL_TIPO: url_tipo,
                                  Constantes.TIMESTAMP: timestamp,
                                  Constantes.DESCRIPCION: descripcion]
        tablaFeed.childByAutoId().updateChildValues(data)
    }
    
    func crearUsuario(nombre_usuario: String, telefono_usuario: String, email_usuario: String, contrasena_usuario: String, foto_usuario: String, id_usuario: String, token_usuario: String, tipo_usuario: String){
        let data: [String:Any] = [Constantes.NOMBRE_USUARIO: nombre_usuario,
                                  Constantes.TELEFONO_USUARIO: telefono_usuario,
                                  Constantes.EMAIL_USUARIO: email_usuario,
                                  Constantes.CONTRASENA_USUARIO: contrasena_usuario,
                                  Constantes.FOTO_USUARIO: foto_usuario,
                                  Constantes.TOKEN_USUARIO: token_usuario,
                                  Constantes.TIPO_USUARIO: tipo_usuario]
        tablaUsuarios.child(id_usuario).updateChildValues(data)
    }
    
    func cambiarTipo(tipo_usuario: String, id_usuario: String){
        let data: [String:Any] = [Constantes.TIPO_USUARIO: tipo_usuario]
        tablaUsuarios.child(id_usuario).updateChildValues(data)
    }
    
    func cambiarToken(token_usuario: String, id_usuario: String){
        let data: [String:Any] = [Constantes.TOKEN_USUARIO: token_usuario]
        tablaUsuarios.child(id_usuario).updateChildValues(data)
    }
    
    func cambiarFoto(foto_usuario: String, id_usuario: String){
        let data: [String:Any] = [Constantes.FOTO_USUARIO: foto_usuario]
        tablaUsuarios.child(id_usuario).updateChildValues(data)
    }
    
    func cambiarContrasena(contrasena_usuario: String, id_usuario: String){
        let data: [String:Any] = [Constantes.CONTRASENA_USUARIO: contrasena_usuario]
        tablaUsuarios.child(id_usuario).updateChildValues(data)
    }
    
    func cambiarEmail(email_usuario: String, id_usuario: String){
        let data: [String:Any] = [Constantes.EMAIL_USUARIO: email_usuario]
        tablaUsuarios.child(id_usuario).updateChildValues(data)
    }
    
    func cambiarTelefono(telefono_usuario: String, id_usuario: String){
        let data: [String:Any] = [Constantes.TELEFONO_USUARIO: telefono_usuario]
        tablaUsuarios.child(id_usuario).updateChildValues(data)
    }
    
    func cambiarNombre(nombre_usuario: String, id_usuario: String){
        let data: [String:Any] = [Constantes.NOMBRE_USUARIO: nombre_usuario]
        tablaUsuarios.child(id_usuario).updateChildValues(data)
    }
    
    
}
