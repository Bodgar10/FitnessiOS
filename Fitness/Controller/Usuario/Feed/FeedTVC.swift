//
//  FeedTVC.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 15/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class FeedTVC: UITableViewController {

    var feed: [Feed] = []
    
    let SEGUE_VIDEO = "video"
    let SEGUE_IMAGEN = "imagen"
    let SEGUE_PDF = "pdf"
    let SEGUE_PDF_COMPRAR = "pdf_comprar"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bajarFeed()
        
    }

    func bajarFeed(){
        self.feed.removeAll()
        BajarInfo.Instance.bajarFeed { (feed1) in
            self.feed.append(feed1)
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.feed.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let inicio = self.feed[indexPath.row]
        
        if inicio.tipo_feed == Constantes.PDF{
            let cell = Bundle.main.loadNibNamed("pdfFeedTVCell", owner: self, options: nil)?.first as! pdfFeedTVCell
            
            if inicio.is_gratis{
                
                cell.viewFree.isHidden = true
                cell.freeLabel.isHidden = true
                
            }else{
                cell.freeLabel.text = "$\(inicio.costo_pdf!)"
            }
            
            cell.imagePdf.downloadImage(from: inicio.imagen_feed)
            cell.nameProfileAdmin.text = inicio.nombre_admin
            cell.imageProfileAdmin.downloadImage(from: inicio.imagen_admin)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            let language = Bundle.main.preferredLocalizations.first
            dateFormatter.locale = Locale.init(identifier: language!)
            let date_publicacion = dateFormatter.date(from: inicio.timestamp)
            
            let dateRangeStart = Date()
            let dateRangeEnd = date_publicacion
            let components = Calendar.current.dateComponents([.hour, .minute], from: dateRangeStart, to: dateRangeEnd!)
            
            if components.hour == 0{
                cell.timeStampLabel.text = "\(components.minute!) minutos"
            }else{
                cell.timeStampLabel.text = "\(components.hour!) horas"
            }
            return cell
        }else if inicio.tipo_feed == Constantes.VIDEO{
            let cell = Bundle.main.loadNibNamed("videoFeedTVCell", owner: self, options: nil)?.first as! videoFeedTVCell
            
            cell.imageVideo.downloadImage(from: inicio.imagen_feed)
            cell.nameProfileAdmin.text = inicio.nombre_admin
            cell.imageProfileAdmin.downloadImage(from: inicio.imagen_admin)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            let language = Bundle.main.preferredLocalizations.first
            dateFormatter.locale = Locale.init(identifier: language!)
            let date_publicacion = dateFormatter.date(from: inicio.timestamp)
            
            let dateRangeStart = Date()
            let dateRangeEnd = date_publicacion
            let components = Calendar.current.dateComponents([.hour, .minute], from: dateRangeStart, to: dateRangeEnd!)
            
            if components.hour == 0{
                cell.timeStampLabel.text = "\(components.minute!) minutos"
            }else{
                cell.timeStampLabel.text = "\(components.hour!) horas"
            }
            
            return cell
        }else{
            let cell = Bundle.main.loadNibNamed("pdfFeedTVCell", owner: self, options: nil)?.first as! pdfFeedTVCell
            
            cell.imagePdf.downloadImage(from: inicio.imagen_feed)
            cell.nameProfileAdmin.text = inicio.nombre_admin
            cell.imageProfileAdmin.downloadImage(from: inicio.imagen_admin)
            cell.viewFree.isHidden = true
            cell.freeLabel.isHidden = true
            cell.viewPdf.isHidden = true
            cell.typePdf.isHidden = true
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            let language = Bundle.main.preferredLocalizations.first
            dateFormatter.locale = Locale.init(identifier: language!)
            let date_publicacion = dateFormatter.date(from: inicio.timestamp)
            
            let dateRangeStart = Date()
            let dateRangeEnd = date_publicacion
            let components = Calendar.current.dateComponents([.hour, .minute], from: dateRangeStart, to: dateRangeEnd!)
            
            if components.hour == 0{
                cell.timeStampLabel.text = "\(components.minute!) minutos"
            }else{
                cell.timeStampLabel.text = "\(components.hour!) horas"
            }
            
            return cell
        }
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let inicio = self.feed[indexPath.row]
        
        if inicio.tipo_feed == Constantes.VIDEO{
            self.performSegue(withIdentifier: self.SEGUE_VIDEO, sender: self)
        }else if inicio.tipo_feed == Constantes.PDF{
            if inicio.is_gratis{
                self.performSegue(withIdentifier: self.SEGUE_PDF, sender: self)
            }else{
                self.performSegue(withIdentifier: self.SEGUE_PDF_COMPRAR, sender: self)
            }
        }else{
            self.performSegue(withIdentifier: self.SEGUE_IMAGEN, sender: self)
        }
    }
}
