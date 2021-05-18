//
//  MainWireFrame.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 18.05.2021.
//

import UIKit

class MainWireFrame {
    
    static func create() -> UIViewController {
        
        let view = MainViewController()
        let router = MainRouter(controller: view)
        let viewModel = MainViewModel()
        view.viewModel = viewModel
        view.router = router
        
        return view
    }
}
