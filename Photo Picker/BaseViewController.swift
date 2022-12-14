//
//  BaseViewController.swift
//  Photo Picker
//
//  Created by Shahzaib Mumtaz on 11/10/2022.
//

import UIKit

typealias imageBlock = ((UIImage) -> ())

class BaseViewController: UIViewController {
    
    var imgBlock: imageBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func showImagePicker(sourceType : UIImagePickerController.SourceType) -> UIImagePickerController {
        let imgPicker =  UIImagePickerController()
        imgPicker.sourceType = sourceType
        imgPicker.delegate = self
        imgPicker.allowsEditing = false
        return imgPicker
    }
}

extension BaseViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true)
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        if imgBlock != nil{
            self.imgBlock!(image)
        }
    }
}
