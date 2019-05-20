//
//  Feed.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 15/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import Foundation

class Feed {
    
    var tipo_feed: String!
    var is_gratis: Bool!
    var imagen_feed: String!
    var costo_pdf: String!
    var url_tipo: String!
    var imagen_admin: String!
    var nombre_admin: String!
    var timestamp: String!
    var descripcion: String!
    
    init(tipo_feed: String, is_gratis: Bool, imagen_feed: String, costo_pdf: String, url_tipo: String, imagen_admin: String, nombre_admin: String, timestamp: String, descripcion: String){
        self.tipo_feed = tipo_feed
        self.is_gratis = is_gratis
        self.imagen_feed = imagen_feed
        self.costo_pdf = costo_pdf
        self.url_tipo = url_tipo
        self.imagen_admin = imagen_admin
        self.nombre_admin = nombre_admin
        self.timestamp = timestamp
        self.descripcion = descripcion
    }
}
