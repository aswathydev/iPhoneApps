//
//  RemoveBackgdImageVC.swift
//  FSCaldrDemo
//
//  Created by reubro on 23/05/19.
//  Copyright © 2019 Reubro. All rights reserved.
//

import UIKit
import GPUImage

class RemoveBackgdImageVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var vWimages: UIView!
    @IBOutlet var orginalImg: UIImageView!
    
    var arrFacilityChecked: [Int] = []
    var maxImages = 5
    var xPosImages = 5.0
    var isFOpened = false
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
    }
    
    //MARK:- button action
    
    @IBAction func takefmGallery(_ sender: Any) {
        checkMaxImages()
        
        imagePicker.sourceType = UIImagePickerController.UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func takefmCamera(_ sender: Any) {
        checkMaxImages()
        
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

  
    }
    
 
    //MARK:- Userdefined function
    
    func checkMaxImages() {
        
        if (maxImages > 0) {
            
            //            return true
            
            if (maxImages == 5) {
                
                for view in vWimages.subviews {
                    
                    view.removeFromSuperview()
                    xPosImages = 5.0
                }
            }
            
        } else {
            
        }
    }

   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        let chosenImage = info["UIImagePickerControllerOriginalImage"] as! UIImage
       // let chosenImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as! UIImage
        //let chosenImage = info[.originalImage] as? UIImage
        let imgSelected = UIImageView.init(frame: CGRect(x: xPosImages, y: 0, width: 42, height: 42))
        imgSelected.contentMode = .scaleAspectFill
        imgSelected.clipsToBounds = true
        imgSelected.image = chosenImage
        vWimages.addSubview(imgSelected)
        
        xPosImages += 50
        maxImages  -= 1
        
        dismiss(animated:true, completion: nil)
       
    }
    
   
}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}
