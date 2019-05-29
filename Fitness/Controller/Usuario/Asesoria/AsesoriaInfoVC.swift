//
//  AsesoriaInfoVC.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 28/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
import Firebase

class AsesoriaInfoVC: UIViewController {

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BajarInfo.Instance.bajarAsesoriaInfo { (asesoria) in
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
        BajarInfo.Instance.bajarValoracionesAsesoria { (valoracion) in
            self.valoraciones.append(valoracion)
            self.valoracionesTableView.reloadData()
        }
    }

}
