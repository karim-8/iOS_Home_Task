//
//  ListHomeCoordinator.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 06/07/2024.
//

import UIKit
import SwiftUI
class HomeCoordinator {
    func navigateTo (navigation: UINavigationController, dataPerCharacter:ResultsDataModel) {

        navigation.navigationBar.isHidden = true
        let characterData = CharacterDetailedObject(dataObject: dataPerCharacter)
        let hostingController = UIHostingController(rootView: ContentView().environmentObject(characterData))
        navigation.pushViewController(hostingController, animated:true)
  }
}

// Passing data while Navigating from UIKit to Swift UI
class CharacterDetailedObject: ObservableObject {
    @Published var dataPerCharacter: ResultsDataModel

    init(dataObject: ResultsDataModel) {
        self.dataPerCharacter = dataObject
        print("Single Character data is... \(self.dataPerCharacter)")
    }
}
