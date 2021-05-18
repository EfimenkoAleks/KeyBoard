//
//  MainRouter.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 18.05.2021.
//

import Foundation
import UIKit

class MainRouter {
    
    private weak var controller: MainViewController?
    
    init(controller: MainViewController?) {
        self.controller = controller
    }
}

extension MainRouter: MainRouterProtocol {
   
//    func route(to routeID: String, from context: UIViewController, parameters: Int) {
//          guard let route = OnbordingViewController.Route(rawValue: routeID) else {
//             return
//          }
//          switch route {
//          case .second:
//           context.navigationController?.pushViewController( SecondWireFrame.create(index: parameters), animated: true)
//          }
//       }
}
