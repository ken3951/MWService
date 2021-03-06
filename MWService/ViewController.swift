//
//  ViewController.swift
//  MWService
//
//  Created by mwk_pro on 2019/4/1.
//  Copyright © 2019 mwk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cameraManager = MWCameraManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        cameraManager.startRecordPhotoAndVideo(imageCompressSize: 1000, imageCompletion: { (image) in
            print("拍照成功")
        }, maxTime: 10, minTime: 5) { (url) in
            print("拍摄成功,videoUrl=\(url.absoluteString)")
        }
    }

}

