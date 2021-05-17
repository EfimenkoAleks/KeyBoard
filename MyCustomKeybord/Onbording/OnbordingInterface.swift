//
//  OnbordingInterface.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 17.05.2021.
//

import Foundation

protocol OnbordingMievModelInputProtocol {
//    func updateExpandedStateForItem(at indexPath: IndexPath)
}

protocol OnbordingMievModelOutputProtocol {

//    var comments: Observable<[SectionModelFirst]> { get }
//    func getIndex(index: IndexPath) -> Int
}

protocol OnbordingViewModelProtocol: OnbordingMievModelInputProtocol, OnbordingMievModelOutputProtocol { }

protocol OnbordingRouterProtocol {
//    func route(to routeID: String, from context: UIViewController, parameters: Int)
}
