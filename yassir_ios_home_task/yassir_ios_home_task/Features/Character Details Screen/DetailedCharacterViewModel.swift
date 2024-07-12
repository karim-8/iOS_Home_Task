//
//  DetailedCharacterViewModel.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 09/07/2024.
//

import Foundation
import SwiftUI

class DetailedCharacterViewModel {

    func getImageUrl(dataObj: CharacterDetailedObject) -> String {
        return dataObj.dataPerCharacter.image ?? ""
    }
    func getCharacterName(dataObj: CharacterDetailedObject) -> String {
        return dataObj.dataPerCharacter.name ?? "Yassir"
    }
    func getCharacterStatus(dataObj: CharacterDetailedObject) -> String {
        return dataObj.dataPerCharacter.status ?? "Status"
    }
    func getCharacterSpecies(dataObj: CharacterDetailedObject) -> String {
        return dataObj.dataPerCharacter.species ?? "Elf"
    }
    func getCharacterGender(dataObj: CharacterDetailedObject) -> String {
        return ".  \(dataObj.dataPerCharacter.gender ?? ".  Male")"
    }
    func getCharacterLocation(dataObj: CharacterDetailedObject) -> String {
        return dataObj.dataPerCharacter.location?.name ?? "Earth"
    }

    // Back Button Action
    func popBackToHomeScreen(presentationMode: Binding<PresentationMode>) {
        presentationMode.wrappedValue.dismiss()
    }
}
