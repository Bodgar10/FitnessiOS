//
//  Extensions.swift
//  Fitness
//
//  Created by bodgar jair espinosa miranda on 07/05/19.
//  Copyright © 2019 bodgar jair espinosa miranda. All rights reserved.
//

import Foundation
import Foundation
import Firebase

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func downloadImage(from imgURL: String!) {
        
        self.image = nil
        
        if imageCache.object(forKey: imgURL as AnyObject) as? UIImage != nil {
            if let cachedImage = imageCache.object(forKey: imgURL as AnyObject) as? UIImage {
                
                self.image = cachedImage
                return
            }else{
                print("ERROR GRANDE")
            }
        }else{
            print("ÑO SE PUEDE")
        }
        
        let url = URLRequest(url: URL(string: imgURL)!)
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                
                if let downloadedImage = UIImage(data: data!) {
                    
                    imageCache.setObject(downloadedImage, forKey: imgURL as AnyObject)
                    self.image = downloadedImage
                }
            }
        }
        
        task.resume()
    }
}
extension UIViewController {
    func hideKeyboardWhenTappingAround(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    //ALERT CONTROLLER
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func notificationSend(message: String, token: String) {
        print("Se envia la notificación al token: \(token)")
        if let url = URL(string: "https://fcm.googleapis.com/fcm/send") {
            
            var request = URLRequest(url: url)
            
            let key = "key=AAAAVR4YIao:APA91bH5R6wCnM3zgA-iTL1TPGTsNUJsoQ-KNdAIkyDM3t6Us5smfBlU8g8O4vphr_lOYp3m9HXkhWF9zKxfA4PmBdjfnTsvX_xM6dGX-raYJqK-L-THbAxlFX6oIaPIXB5UUBVr1MFY"
            
            request.allHTTPHeaderFields = ["Authorization": key,
                                           "Content-Type": "application/json"]
            request.httpMethod = "POST"
            request.httpBody = "{\"to\": \"\(token)\", \"notification\":{\"body\":\"\(message)\", \"sound\": \"sms-received.wav\"}}".data(using: .utf8)
            
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if error != nil {
                    print("Error")
                }
                
                print("DATA: \(data), RESPONSE: \(response), ERROR: \(error)")
            }).resume()
        }
    }
    //func alertChangeMoneda(usd:String, segueUsd:String, mxn:String, segueMxn:String)
}

extension UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
