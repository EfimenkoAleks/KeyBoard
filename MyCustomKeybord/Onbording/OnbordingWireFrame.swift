//
//  OnbordingWireFrame.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 17.05.2021.
//

import UIKit

class OnbordingWireFrame {
    
    static func create() -> UIViewController {
        
        let view = OnbordingViewController()
        let router = OnbordingRouter(controller: view)
        let viewModel = OnbordingViewModel()
        view.viewModel = viewModel
        view.router = router
        
        return view
    }
}

