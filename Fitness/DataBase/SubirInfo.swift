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
    
    var tablaAsesoriaInfo: DatabaseReference{
        return dbRef.child(Constantes.TABLA_ASESORIA_INFO)
    }
    
    var tablaValoraciones: DatabaseReference{
        return dbRef.child(Constantes.TABLA_VALORACIONES_ASESORIA)
    }
    
    var tablaPlanes: DatabaseReference{
        return dbRef.child(Constantes.TABLA_PLANES)
    }
    
    func crearPlanes(id_plan: String, meses_plan: String, descripcion_plan: String, costo_plan: String){
        let data: [String:Any] = [Constantes.ID_PLAN: id_plan,
                                  Constantes.MESES_PLAN: meses_plan,
                                  Constantes.DESCRIPCION_PLAN: descripcion_plan,
                                  Constantes.COSTO_PLAN: costo_plan]
        tablaPlanes.child(id_plan).updateChildValues(data)
    }
    
    func cambiarMesPlan(meses_plan: String, id_plan: String){
        let data: [String:Any] = [Constantes.MESES_PLAN: meses_plan]
        tablaPlanes.child(id_plan).updateChildValues(data)
    }
    
    func cambiarDescripcionPlan(descripcion_plan: String, id_plan: String){
        let data: [String:Any] = [Constantes.DESCRIPCION_PLAN: descripcion_plan]
        tablaPlanes.child(id_plan).updateChildValues(data)
    }
    
    func cambiarCostoPlan(costo_plan: String, id_plan: String){
        let data: [String:Any] = [Constantes.COSTO_PLAN: costo_plan]
        tablaPlanes.child(id_plan).updateChildValues(data)
    }

    func crearAsesoria(id_asesoria: String, imagen_portada: String, descripcion_asesoria: String, costo_asesoria: String, video_explicativo: String, rutinas_imagen: String, rutinas_descripcion: String, alimentos_imagen: String, alimentos_descripcion: String){
        let data: [String:Any] = [Constantes.ID_ASESORIA: id_asesoria,
                                  Constantes.IMAGEN_PORTADA: imagen_portada,
                                  Constantes.DESCRIPCION_ASESORIA: descripcion_asesoria,
                                  Constantes.COSTO_ASESORIA: costo_asesoria,
                                  Constantes.VIDEO_EXPLICATIVO: video_explicativo,
                                  Constantes.RUTINAS_IMAGEN: rutinas_imagen,
                                  Constantes.RUTINAS_DESCRIPCION: rutinas_descripcion,
                                  Constantes.ALIMENTOS_IMAGEN: alimentos_imagen,
                                  Constantes.ALIMENTOS_DESCRIPCION: alimentos_descripcion]
        tablaAsesoriaInfo.child(id_asesoria).updateChildValues(data)
    }
    
    func cambiarAlimentosDescripcion(alimentos_descripcion: String, id_asesoria: String){
        let data: [String:Any] = [Constantes.ALIMENTOS_DESCRIPCION: alimentos_descripcion]
        tablaAsesoriaInfo.child(id_asesoria).updateChildValues(data)
    }
    
    func cambiarAlimentosImagen(alimentos_imagen: String, id_asesoria: String){
        let data: [String:Any] = [Constantes.ALIMENTOS_IMAGEN: alimentos_imagen]
        tablaAsesoriaInfo.child(id_asesoria).updateChildValues(data)
    }
    
    func cambiarRutinasDescripcion(rutinas_descripcion: String, id_asesoria: String){
        let data: [String:Any] = [Constantes.RUTINAS_DESCRIPCION: rutinas_descripcion]
        tablaAsesoriaInfo.child(id_asesoria).updateChildValues(data)
    }
    
    func cambiarRutinasImagen(rutinas_imagen: String, id_asesoria: String){
        let data: [String:Any] = [Constantes.RUTINAS_IMAGEN: rutinas_imagen]
        tablaAsesoriaInfo.child(id_asesoria).updateChildValues(data)
    }
    
    func cambiarVideoExplicativo(video_explicativo: String, id_asesoria: String){
        let data: [String:Any] = [Constantes.VIDEO_EXPLICATIVO: video_explicativo]
        tablaAsesoriaInfo.child(id_asesoria).updateChildValues(data)
    }
    
    func cambiarCostoAsesoria(costo_asesoria: String, id_asesoria: String){
        let data: [String:Any] = [Constantes.COSTO_ASESORIA: costo_asesoria]
        tablaAsesoriaInfo.child(id_asesoria).updateChildValues(data)
    }
    
    func cambiarDescripcionAsesoria(descripcion_asesoria: String, id_asesoria: String){
        let data: [String:Any] = [Constantes.DESCRIPCION_ASESORIA: descripcion_asesoria]
        tablaAsesoriaInfo.child(id_asesoria).updateChildValues(data)
    }
    
    func cambiarImagenPortada(imagen_portada: String, id_asesoria: String){
        let data: [String:Any] = [Constantes.IMAGEN_PORTADA: imagen_portada]
        tablaAsesoriaInfo.child(id_asesoria).updateChildValues(data)
    }
    
    func crearValoracion(id_usuario_valoracion: String, id_valoracion: String, descripcion_valoracion: String, fecha_valoracion: String, imagen_antes: String, imagen_despues: String, valoracion: String){
        let data: [String:Any] = [Constantes.ID_USUARIO_VALORACION: id_usuario_valoracion,
                                  Constantes.ID_VALORACION: id_valoracion,
                                  Constantes.DESCRIPCION_VALORACION: descripcion_valoracion,
                                  Constantes.FECHA_VALORACION: fecha_valoracion,
                                  Constantes.IMAGEN_ANTES: imagen_antes,
                                  Constantes.IMAGEN_DESPUES: imagen_despues,
                                  Constantes.VALORACION: valoracion]
        tablaValoraciones.childByAutoId().updateChildValues(data)
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
