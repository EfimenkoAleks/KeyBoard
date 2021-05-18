//
//  MokOnbording.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 18.05.2021.
//

import Foundation

protocol MokOnbordingProtocol {
    func create() -> [OnbordingModel]
}

class MokOnbordingImplementation: MokOnbordingProtocol {

    func create() -> [OnbordingModel] {
        let onbordings: [OnbordingModel] = [
            OnbordingModel(title: "Configure Scribens", subTitle: "STEP 1 OF 3", description: "To use Scribens please add the keyboard by allowing full access", image: "onbording1", buttonTitle: "ADD THE SCRIBENS KEYBOARD"),
            OnbordingModel(title: "Configure Scribens", subTitle: "STEP 2 OF 3", description: "Please set Scribens as the default keyboard", image: "onbording2", buttonTitle: "SELECT SCRIBENS"),
            OnbordingModel(title: "Scribens is ready!", subTitle: "STEP 3 of 3", description: "You can now use the keyboard anywhere on your phone to benefit from spelling and grammar correction on your texts", image: "onbording3", buttonTitle: "FINISH")
        ]
        return onbordings
    }
}
