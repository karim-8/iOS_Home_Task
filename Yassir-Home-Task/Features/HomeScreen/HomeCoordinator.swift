//
//  ListHomeCoordinator.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 06/07/2024.
//

import UIKit
import SwiftUI
class HomeCoordinator {
    func navigateTo (navigation: UINavigationController) {
        navigation.navigationBar.isHidden = true
        let hostingController = UIHostingController(rootView: ContentView())
        navigation.pushViewController(hostingController, animated:true)
  }
}
