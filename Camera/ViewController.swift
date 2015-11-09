//
//  ViewController.swift
//  Camera
//
//  Created by oimo on 2015/10/08.
//  Copyright © 2015年 FBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,
                                            UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func lanchCamera(sender: UIBarButtonItem) {
        
        let camera = UIImagePickerControllerSourceType.Camera
        
        //カメラボタンがタップされた時の処理
        if UIImagePickerController.isSourceTypeAvailable(camera) {
            let picker = UIImagePickerController()
            picker.sourceType = camera
            picker.delegate = self
            self.presentViewController(picker,animated: true, completion: nil)
        }
        //撮影し終わった時の処理
        func imagePickerController(picker: UIImagePickerController,
                    didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = image
            UIImageWriteToSavedPhotosAlbum(image,nil,nil,nil)
                        self.dismissViewControllerAnimated(true,completion:nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

