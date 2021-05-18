//
//  OnbordingInterface.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 17.05.2021.
//

import UIKit

protocol OnbordingMievModelInputProtocol {

}

protocol OnbordingMievModelOutputProtocol {
    func curentModel(index: Int) -> OnbordingModel
    func countModel() -> Int
}

protocol OnbordingViewModelProtocol: OnbordingMievModelInputProtocol, OnbordingMievModelOutputProtocol { }

protocol OnbordingRouterProtocol {
    func route(to routeID: String, from context: UIViewController)
}
