//
//  ListHomeViewModel.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 06/07/2024.
//

import Foundation

class HomeViewModel {
    
    private var coordinator: HomeCoordinator?
    
    //MARK:- INIT
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
}
