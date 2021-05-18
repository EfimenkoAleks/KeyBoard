//
//  OnbordingRouter.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 17.05.2021.
//

import Foundation
import UIKit

class OnbordingRouter {
    
    private weak var controller: OnbordingViewController?
    
    init(controller: OnbordingViewController?) {
        self.controller = controller
    }
}

extension OnbordingRouter: OnbordingRouterProtocol {
   
    func route(to routeID: String, from context: UIViewController) {
          guard let route = OnbordingViewController.Route(rawValue: routeID) else {
             return
          }
          switch route {
          case .main:
            let mainController = MainWireFrame.create()
            let navigate = UINavigationController(rootViewController: mainController)
            navigate.modalPresentationStyle = .fullScreen
        
            context.present(navigate, animated: true, completion: nil)
          }
       }
}
