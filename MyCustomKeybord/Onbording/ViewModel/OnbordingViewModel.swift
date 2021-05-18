//
//  OnbordingViewModel.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 17.05.2021.
//

import Foundation

class OnbordingViewModel: OnbordingViewModelProtocol {
   
//    private var apiService: APIServiceFirstProtocol
//    private let reloadComment: BehaviorRelay<[SectionModelFirst]>
    
    private var onbordings: [OnbordingModel]
    private var service: MokOnbordingProtocol
    
    init(service: MokOnbordingProtocol) {
        self.service = service
        self.onbordings = self.service.create()
    }
    
    func curentModel(index: Int) -> OnbordingModel {
        return self.onbordings[index]
    }
    
    func countModel() -> Int {
        return self.onbordings.count
    }
    
    func titleForButton() {
        
    }
}
