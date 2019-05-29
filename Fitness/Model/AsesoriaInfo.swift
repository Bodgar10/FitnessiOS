//
//  AsesoriaInfo.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 28/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import Foundation

class AsesoriaInfo {
    
    var id_asesoria: String
    var imagen_portada: String
    var descripcion_asesoria: String
    var costo_asesoria: String
    var video_explicativo: String
    var rutinas_imagen: String
    var rutinas_descripcion: String
    var alimentos_imagen: String
    var alimentos_descripcion: String
    
    init(id_asesoria: String, imagen_portada: String, descripcion_asesoria: String, costo_asesoria: String, video_explicativo: String, rutinas_imagen: String, rutinas_descripcion: String, alimentos_imagen: String, alimentos_descripcion: String){
        self.id_asesoria = id_asesoria
        self.imagen_portada = imagen_portada
        self.descripcion_asesoria = descripcion_asesoria
        self.costo_asesoria = costo_asesoria
        self.video_explicativo = video_explicativo
        self.rutinas_imagen = rutinas_imagen
        self.rutinas_descripcion = rutinas_descripcion
        self.alimentos_imagen = alimentos_imagen
        self.alimentos_descripcion = alimentos_descripcion
    }
}
