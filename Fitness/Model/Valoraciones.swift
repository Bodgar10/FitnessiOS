//
//  Valoraciones.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 28/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import Foundation

class Valoraciones {
    
    var id_usuario_valoracion: String
    var id_valoracion: String
    var descripcion_valoracion: String
    var fecha_valoracion: String
    var imagen_antes: String
    var imagen_despues: String
    var valoracion: String
    var nombre_usuario: String
    var foto_usuario: String
    
    init(id_usuario_valoracion: String, id_valoracion: String, descripcion_valoracion: String, fecha_valoracion: String, imagen_antes: String, imagen_despues: String, valoracion: String, nombre_usuario: String, foto_usuario: String){
        self.id_usuario_valoracion = id_usuario_valoracion
        self.id_valoracion = id_valoracion
        self.descripcion_valoracion = descripcion_valoracion
        self.fecha_valoracion = fecha_valoracion
        self.imagen_antes = imagen_antes
        self.imagen_despues = imagen_despues
        self.valoracion = valoracion
        self.nombre_usuario = nombre_usuario
        self.foto_usuario = foto_usuario
    }
}
