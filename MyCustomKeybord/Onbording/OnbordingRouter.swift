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
