//
//  MainInterface.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 18.05.2021.
//

import Foundation

protocol MainViewModelInputProtocol {

}

protocol MainViewModelOutputProtocol {
//    func curentModel(index: Int) -> OnbordingModel
//    func countModel() -> Int
}

protocol MainViewModelProtocol: MainViewModelInputProtocol, MainViewModelOutputProtocol { }

protocol MainRouterProtocol {
//    func route(to routeID: String, from context: UIViewController, parameters: Int)
}
