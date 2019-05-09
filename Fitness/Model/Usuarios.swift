//
//  Usuarios.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 08/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import Foundation

class Usuarios{

    var nombre_usuario: String!
    var telefono_usuario: String!
    var email_usuario: String!
    var contrasena_usuario: String!
    var foto_usuario: String!
    var id_usuario: String!
    var token_usuario: String!
    var tipo_usuario: String!
    
    init(nombre_usuario: String, telefono_usuario: String, email_usuario: String, contrasena_usuario: String, foto_usuario: String, id_usuario: String, token_usuario: String, tipo_usuario: String){
        self.nombre_usuario = nombre_usuario
        self.telefono_usuario = telefono_usuario
        self.email_usuario = email_usuario
        self.contrasena_usuario = contrasena_usuario
        self.foto_usuario = foto_usuario
        self.id_usuario = id_usuario
        self.token_usuario = token_usuario
        self.tipo_usuario = tipo_usuario
    }
}
