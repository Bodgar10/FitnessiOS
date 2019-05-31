//
//  Planes.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 30/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import Foundation

class Planes{
    var id_plan: String
    var meses_plan: String
    var descripcion_plan: String
    var costo_plan: String
    
    init(id_plan: String, meses_plan: String, descripcion_plan: String, costo_plan: String){
        self.id_plan = id_plan
        self.meses_plan = meses_plan
        self.descripcion_plan = descripcion_plan
        self.costo_plan = costo_plan
    }
}
