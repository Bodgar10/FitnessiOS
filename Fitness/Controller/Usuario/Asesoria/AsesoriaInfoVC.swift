//
//  AsesoriaInfoVC.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 28/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
import Firebase

class AsesoriaInfoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var imagenPortada: UIImageView!
    
    @IBOutlet weak var numAsesorias: UILabel!
    @IBOutlet weak var preciolabel: UILabel!
    @IBOutlet weak var valoracionLabel: UILabel!
    
    @IBOutlet weak var imagePerfilAdmin: UIImageView!
    @IBOutlet weak var nameAdminLabel: UILabel!
    @IBOutlet weak var profesionAdminLabel: UILabel!
    
    @IBOutlet weak var descripcionAsesoriaLabel: UITextView!
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var rutinasImagen: UIImageView!
    @IBOutlet weak var descripcionRutinasLabel: UITextView!
    
    @IBOutlet weak var alimentosImagen: UIImageView!
    @IBOutlet weak var descripcionAlimentosLabel: UITextView!
    
    @IBOutlet weak var valoracionComentariosLabel: UILabel!
    @IBOutlet weak var numAsesoriasLabel: UILabel!
    
    @IBOutlet weak var cincoEstrellasSlider: UISlider!
    @IBOutlet weak var cuatroEstrellasSlider: UISlider!
    @IBOutlet weak var tresEstrellasSlider: UISlider!
    @IBOutlet weak var dosEstrellasSlider: UISlider!
    @IBOutlet weak var unaEstrellaSlider: UISlider!
    
    @IBOutlet weak var valoracionesTableView: UITableView!
    
    var valoraciones: [Valoraciones] = []
    
    var num = Int()
    var valoration = Double()
    var numReviews = 0
    
    var numReviews5 = 0
    var numReviews4 = 0
    var numReviews3 = 0
    var numReviews2 = 0
    var numReviews1 = 0
    
    let SEGUE_VIDEO = "video"
    let SEGUE_COMPRAR = "comprar"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.addBottomSheetView()
        
        /*BajarInfo.Instance.bajarAsesoriaInfo { (asesoria) in
            self.imagenPortada.downloadImage(from: asesoria.imagen_portada)
            self.preciolabel.text = "$\(asesoria.costo_asesoria)"
            self.descripcionAsesoriaLabel.text = asesoria.descripcion_asesoria
            self.rutinasImagen.downloadImage(from: asesoria.rutinas_imagen)
            self.descripcionRutinasLabel.text = asesoria.rutinas_descripcion
            self.alimentosImagen.downloadImage(from: asesoria.alimentos_imagen)
            self.descripcionAlimentosLabel.text = asesoria.alimentos_descripcion
        }
        
        BajarInfo.Instance.bajarUsuarios { (usuario) in
            if usuario.tipo_usuario == Constantes.ADMIN{
                self.imagePerfilAdmin.downloadImage(from: usuario.foto_usuario)
                self.nameAdminLabel.text = usuario.nombre_usuario
            }
        }
        
        self.valoraciones.removeAll()
        var promedio = 0.0
        BajarInfo.Instance.bajarValoracionesAsesoria { (valoracion) in
            self.valoraciones.append(valoracion)
            self.valoracionesTableView.reloadData()
            
            
            self.valoration += Double(valoracion.valoracion)!
            self.num += 1
            
            promedio = self.valoration / Double(self.num)
            print("VALORCION: \(promedio)")
            self.valoracionLabel.text = "\(String(format: "%.2f", promedio))"
            self.valoracionComentariosLabel.text = "\(String(format: "%.2f", promedio))"
            
            self.numReviews += 1
            self.numAsesorias.text = "\(self.numReviews) Reviews"
            
            if valoracion.valoracion == "5"{
                self.numReviews5 += 1
                
                let numReal = self.numReviews5/self.numReviews
                self.cincoEstrellasSlider.value = Float(numReal)
                
            }else if valoracion.valoracion == "4"{
                self.numReviews4 += 1
                
                let numReal = self.numReviews4/self.numReviews
                self.cuatroEstrellasSlider.value = Float(numReal)
            }else if valoracion.valoracion == "3"{
                self.numReviews3 += 1
                
                let numReal = self.numReviews3/self.numReviews
                self.tresEstrellasSlider.value = Float(numReal)
            }else if valoracion.valoracion == "2"{
                self.numReviews2 += 1
                
                let numReal = self.numReviews2/self.numReviews
                self.dosEstrellasSlider.value = Float(numReal)
            }else{
                self.numReviews1 += 1
                
                let numReal = self.numReviews1/self.numReviews
                self.unaEstrellaSlider.value = Float(numReal)
            }
        }*/
    }
    
    func addBottomSheetView(scrollable: Bool? = false) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "comprar") as? ComprarAsesoriaVC {
            //vc.pedido = self.pedido
            
            /*vc.removeFromParentViewController()
             vc.willMove(toParentViewController: nil)
             vc.view.removeFromSuperview()*/
            
            self.addChild(vc)
            //vc.view.bringSubview(toFront: self.view)
            self.view.addSubview(vc.view)
            vc.didMove(toParent: self)
            let height = CGFloat(1000.0)
            let width  = view.frame.width
            vc.view.frame = CGRect(x: 0, y: self.view.frame.maxX, width: width, height: height)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.valoraciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let valoracion = self.valoraciones[indexPath.row]
        
        if valoracion.imagen_antes == "nil"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ValoracionTableViewCell
            
            cell.imagenPerfil.downloadImage(from: valoracion.foto_usuario)
            cell.nombrePerfil.text = valoracion.nombre_usuario
            cell.descripcionLabel.text = valoracion.foto_usuario
            cell.fechaPerfil.text = valoracion.fecha_valoracion
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ValoracionImagenTVCell
            
            cell.fotoPerfil.downloadImage(from: valoracion.foto_usuario)
            cell.nombrePerfil.text = valoracion.nombre_usuario
            cell.descripcionLabel.text = valoracion.foto_usuario
            cell.fechaPerfil.text = valoracion.fecha_valoracion
            cell.imagenAntes.downloadImage(from: valoracion.imagen_antes)
            cell.imagenDespues.downloadImage(from: valoracion.imagen_despues)
            return cell
        }
    }
}
