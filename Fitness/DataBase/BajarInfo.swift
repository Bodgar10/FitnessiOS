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
    
    func guardarImagenes(post: String, image: UIImage, name: String, completion: @escaping (String) -> Void){
        let storage = Storage.storage().reference(forURL: "gs://fitnesapp-c714f.appspot.com/")
        let Poststorage = storage.child(post)
        let imageRef = Poststorage.child("\(name).jpg")
        let data = image.jpegData(compressionQuality: 0.75)
        let uploadTask = imageRef.putData(data!, metadata: nil) { (metadata, error) in
            if error != nil {
                //self.endActivityIndicator()
                completion(Constantes.MESSAGE_FAIL)
                //self.alert(title: "Hubo un error", message: "Inténtalo más tarde.")
            }else {
                //self.endActivityIndicator()
                imageRef.downloadURL(completion: { (url, error) in
                    if error != nil {
                        completion("\(error!.localizedDescription)")
                        print(error?.localizedDescription ?? "")
                    }else {
                        completion(url!.absoluteString)
                    }
                })
            }
        }
        uploadTask.resume()
    }
    
    func guardarPdf(post: String, pdf: String, name: String, completion: @escaping (String) -> Void){
        let storage = Storage.storage().reference(forURL: "gs://fitnesapp-c714f.appspot.com/")
        let Poststorage = storage.child(post)
        let imageRef = Poststorage.child("\(name).pdf")
        let data = URL(fileURLWithPath: Bundle.main.path(forResource: pdf, ofType: "pdf")!)
        let uploadTask = imageRef.putFile(from: data, metadata: nil) { (metadata, error) in
            if error != nil{
                completion(error!.localizedDescription)
            }else{
                imageRef.downloadURL(completion: { (url, error) in
                    if let error = error{
                        completion(error.localizedDescription)
                    }else if let url = url {
                        completion(url.absoluteString)
                    }
                })
            }
        }
        uploadTask.resume()
    }
    
    func guardarVideo(post: String, video: String, name: String, completion: @escaping (String) -> Void){
        let storage = Storage.storage().reference(forURL: "gs://fitnesapp-c714f.appspot.com/")
        let Poststorage = storage.child(post)
        let imageRef = Poststorage.child("\(name).mp4")
        
        let data = URL(fileURLWithPath: Bundle.main.path(forResource: video, ofType: "mp4")!)
        let uploadTask = imageRef.putFile(from: data, metadata: nil) { (metadata, error) in
            if error != nil{
                completion(error!.localizedDescription)
            }else{
                imageRef.downloadURL(completion: { (url, error) in
                    if let error = error{
                        completion(error.localizedDescription)
                    }else if let url = url {
                        completion(url.absoluteString)
                    }
                })
            }
        }
        uploadTask.resume()
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
    
    func bajarFeed(completion: @escaping (Feed) -> Void){
        SubirInfo.Instance.tablaFeed.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let tipo_feed = data[Constantes.TIPO_FEED] as? String,
                    let is_gratis = data[Constantes.IS_GRATIS] as? Bool,
                    let imagen_feed = data[Constantes.IMAGEN_FEED] as? String{
                    if let costo_pdf = data[Constantes.COSTO_PDF] as? String,
                        let url_tipo = data[Constantes.URL_TIPO] as? String,
                        let timestamp = data[Constantes.TIMESTAMP] as? String,
                        let descripcion = data[Constantes.DESCRIPCION] as? String{
                        BajarInfo.Instance.bajarUsuarios(completion: { (usuario) in
                            if usuario.tipo_usuario == Constantes.ADMIN{
                                completion(Feed(tipo_feed: tipo_feed, is_gratis: is_gratis, imagen_feed: imagen_feed, costo_pdf: costo_pdf, url_tipo: url_tipo, imagen_admin: usuario.foto_usuario, nombre_admin: usuario.nombre_usuario, timestamp: timestamp, descripcion: descripcion))
                            }
                        })
                    }else{
                        print("FEED 3")
                    }
                }else{
                    print("FEED 2")
                }
            }else{
                print("FEED 1")
            }
        }
    }
    
    func bajarAsesoriaInfo(completion: @escaping (AsesoriaInfo) -> Void){
        SubirInfo.Instance.tablaAsesoriaInfo.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let id_asesoria = data[Constantes.ID_ASESORIA] as? String,
                    let imagen_portada = data[Constantes.IMAGEN_PORTADA] as? String,
                    let descripcion_asesoria = data[Constantes.DESCRIPCION_ASESORIA] as? String{
                    if let costo_asesoria = data[Constantes.COSTO_ASESORIA] as? String,
                        let video_explicativo = data[Constantes.VIDEO_EXPLICATIVO] as? String,
                        let rutinas_imagen = data[Constantes.RUTINAS_IMAGEN] as? String,
                        let rutinas_descripcion = data[Constantes.RUTINAS_DESCRIPCION] as? String{
                        if let alimentos_imagen = data[Constantes.ALIMENTOS_IMAGEN] as? String,
                            let alimentos_descripcion = data[Constantes.ALIMENTOS_DESCRIPCION] as? String{
                            completion(AsesoriaInfo(id_asesoria: id_asesoria, imagen_portada: imagen_portada, descripcion_asesoria: descripcion_asesoria, costo_asesoria: costo_asesoria, video_explicativo: video_explicativo, rutinas_imagen: rutinas_imagen, rutinas_descripcion: rutinas_descripcion, alimentos_imagen: alimentos_imagen, alimentos_descripcion: alimentos_descripcion))
                        }else{
                            print("ASESORIA INFO 4")
                        }
                    }else{
                        print("ASESORIA INFO 3")
                    }
                }else{
                    print("ASESORIA INFO 2")
                }
            }else{
                print("ASESORIA INFO 1")
            }
        }
    }
    
    func bajarValoracionesAsesoria(completion: @escaping (Valoraciones) -> Void){
        SubirInfo.Instance.tablaValoraciones.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let id_usuario_valoracion = data[Constantes.ID_USUARIO_VALORACION] as? String,
                    let id_valoracion = data[Constantes.ID_VALORACION] as? String,
                    let descripcion_valoracion = data[Constantes.DESCRIPCION_VALORACION] as? String{
                    if let fecha_valoracion = data[Constantes.FECHA_VALORACION] as? String,
                        let imagen_antes = data[Constantes.IMAGEN_ANTES] as? String,
                        let imagen_despues = data[Constantes.IMAGEN_DESPUES] as? String,
                        let valoracion = data[Constantes.VALORACION] as? String{
                        self.bajarUsuarios(completion: { (usuario) in
                            if usuario.id_usuario == id_usuario_valoracion{
                                completion(Valoraciones(id_usuario_valoracion: id_usuario_valoracion, id_valoracion: id_valoracion, descripcion_valoracion: descripcion_valoracion, fecha_valoracion: fecha_valoracion, imagen_antes: imagen_antes, imagen_despues: imagen_despues, valoracion: valoracion, nombre_usuario: usuario.nombre_usuario, foto_usuario: usuario.foto_usuario))
                            }
                        })
                    }else{
                        print("VALORACION 3")
                    }
                }else{
                    print("VALORACION 2")
                }
            }else{
                print("VALORACION 1")
            }
        }
    }
    
    func bajarPlanes(completion: @escaping (Planes) -> Void){
        SubirInfo.Instance.tablaPlanes.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let id_plan = data[Constantes.ID_USUARIO_VALORACION] as? String,
                    let meses_plan = data[Constantes.ID_VALORACION] as? String,
                    let descripcion_plan = data[Constantes.DESCRIPCION_VALORACION] as? String{
                    if let costo_plan = data[Constantes.FECHA_VALORACION] as? String{
                        completion(Planes(id_plan: id_plan, meses_plan: meses_plan, descripcion_plan: descripcion_plan, costo_plan: costo_plan))
                    }else{
                        print("VALORACION 3")
                    }
                }else{
                    print("VALORACION 2")
                }
            }else{
                print("VALORACION 1")
            }
        }
    }

}
