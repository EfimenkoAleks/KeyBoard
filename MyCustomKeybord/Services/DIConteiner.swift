//
//  DIConteiner.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 18.05.2021.
//

import Foundation

class DIContainer {
    static var shared = DIContainer()
    
    lazy var apiServiceOnbording: MokOnbordingProtocol = MokOnbordingImplementation()
   
}
