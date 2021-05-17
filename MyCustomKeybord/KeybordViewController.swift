//
//  KeybordViewController.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 14.05.2021.
//

import UIKit
import AVFoundation
import Photos

class EfKeybordViewController: UIViewController {

    private lazy var titleTextField: UITextField = {
        let lb = UITextField()
        lb.font = UIFont.boldSystemFont(ofSize: 22)
        lb.text = ""
//        lb.numberOfLines = 0
        lb.backgroundColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        self.createConstr()
        
        //Camera
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
                if response {
                    //access granted
                } else {

                }
            }

            //Photos
            let photos = PHPhotoLibrary.authorizationStatus()
            if photos == .notDetermined {
                PHPhotoLibrary.requestAuthorization({status in
                    if status == .authorized{
                        
                    } else {
                        
                    }
                })
            }
    }

    private func createConstr() {
        self.view.addSubview(titleTextField)
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            titleTextField.heightAnchor.constraint(equalToConstant: 300),
            titleTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }

}
