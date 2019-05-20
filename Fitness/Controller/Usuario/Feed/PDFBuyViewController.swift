//
//  PDFBuyViewController.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 19/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
import PDFKit
import Firebase
import SafariServices

class PDFBuyViewController: UIViewController, PDFViewDelegate, PDFDocumentDelegate {

    let pdfView = PDFView()
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var buyView: UIView!
    
    @IBOutlet weak var labelPrecio: UILabel!
    
    var pdfBuy: Feed!
    let textview = UITextView()
    
    let SEGUE_BUY = "buy"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.labelDescription.text = self.pdfBuy.descripcion
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.viewBuy))
        self.buyView.addGestureRecognizer(tap)
        self.buyView.isUserInteractionEnabled = true
        
        self.labelPrecio.text = "$\(self.pdfBuy.costo_pdf!)"
    }
    
    @objc func viewBuy(){
        self.performSegue(withIdentifier: self.SEGUE_BUY, sender: self)
    }
    
    
    func load(_ name: String) {
        let path = self.pdfBuy.url_tipo
        
        let url = NSURL(string: path!)
        //Cargar el PDF usando la clase PDFDocument, con una URL
        if let document = PDFDocument(url: url! as URL){
            //Asignar el PDFDocument a la PDFView de nuestra app
            document.delegate = self
            self.pdfView.document = document
            
            //self.pdfView.displayMode = .singlePage
            
            //Llamar al método goToFirstPage()
            self.pdfView.goToFirstPage(nil)
            
            self.readText()
            
            //Mostrar el nombre del fichero en la barra de título del iPad.
            if UIDevice.current.userInterfaceIdiom == .pad {
                title = name
            }
        }
    }
    
    
    @objc func promptForSearch(){
        let alert = UIAlertController(title: "Buscar", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        alert.addAction(UIAlertAction(title: "Buscar", style: .default, handler:
            { action in
                guard let searchText = alert.textFields?[0].text else { return }
                
                guard let match = self.pdfView.document?.findString(searchText, fromSelection: self.pdfView.highlightedSelections?.first, withOptions: .caseInsensitive) else {return}
                
                self.pdfView.go(to: match)
                
                self.pdfView.highlightedSelections = [match]
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
    
    
    @objc func shareSelection(sender: UIBarButtonItem){
        
        guard let selection = self.pdfView.currentSelection?.attributedString else{
            let alert = UIAlertController(title: "No hay nada seleccionado", message: "Selecciona un fragmento del archivo para compartir.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }
        
        let activityVC = UIActivityViewController(activityItems: [selection], applicationActivities: nil)
        activityVC.popoverPresentationController?.barButtonItem = sender
        
        present(activityVC, animated:  true)
    }
    
    
    func pdfViewWillClick(onLink sender: PDFView, with url: URL) {
        let viewcontroller = SFSafariViewController(url: url)
        viewcontroller.modalPresentationStyle = .formSheet
        present(viewcontroller, animated: true)
        
    }
    
    
    @objc func changePDFMode(segmentedControl: UISegmentedControl){
        if segmentedControl.selectedSegmentIndex == 0 {
            //Mostrar PDF
            pdfView.isHidden = false
            textview.isHidden = true
        } else {
            //Mostrar Texto
            pdfView.isHidden = true
            textview.isHidden = false
        }
    }
    
    
    func readText() {
        guard let pageCount = self.pdfView.document?.pageCount else { return }
        
        let pdfContent = NSMutableAttributedString()
        
        let space = NSAttributedString(string: "\n\n\n")
        
        for i in 1..<pageCount {
            guard let page = self.pdfView.document?.page(at: i) else { continue }
            guard let pageContent = page.attributedString else { continue }
            
            pdfContent.append(space)
            pdfContent.append(pageContent)
        }
        
        
        
        let pattern = "https://[a-z0-9].[a-z]"
        let regexp = try? NSRegularExpression(pattern: pattern)
        let range = NSMakeRange(0, pdfContent.string.utf16.count)
        
        if let matches = regexp?.matches(in: pdfContent.string, options: [], range: range) {
            for match in matches.reversed() {
                pdfContent.replaceCharacters(in: match.range, with: "")
            }
        }
        
        
        self.textview.attributedText = pdfContent
    }
}
