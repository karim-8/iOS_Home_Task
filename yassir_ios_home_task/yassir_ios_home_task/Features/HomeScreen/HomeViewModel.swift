//
//  ListHomeViewModel.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 06/07/2024.
//

import Foundation

class HomeViewModel {
    
    private var coordinator: HomeCoordinator?
    var charactersDataInfo = [ResultsDataModel]()
    var filterdCharactersDataInfo = [ResultsDataModel]()
    var filtersPerStatusArray = [String]()
    var homeUseCase: HomeUseCase?
    var homeRepo: HomeRepositoryProtocol?
    var isPaginating = false

    //MARK:- INIT
    init(coordinator: HomeCoordinator, useCase: HomeUseCase) {
        self.coordinator = coordinator
        self.homeUseCase = useCase
    }

    //MARK:- GET CHARACTER INFO
    func getCharacterInfo(pageNumber: Int) {
        let parameters = "?page=\(pageNumber)"
        let fullUrl = request(url: urlEndPoint.baseUrl.rawValue, param: parameters)
        
        _ = setSpinnerState(shouldStartLoading: true)
        homeUseCase?.fetchData(from: fullUrl) { [weak self] result in
            switch result {
            case .success(let data):
                self?.charactersDataInfo.append(contentsOf: data.results ?? [])
                self?.filterdCharactersDataInfo.append(contentsOf: data.results ?? [])
                _ = self?.getStatusTypes(charactersData: self?.charactersDataInfo ?? [] )
            case .failure(let error):
                print("Error while fetchhing data...\(error)")
            }
          }
        }

        func setSpinnerState(shouldStartLoading: Bool) -> Bool {
           return shouldStartLoading
        }

        func getFilteredStatusData() -> [ResultsDataModel] {
          return filterdCharactersDataInfo
        }

        func getCharactersData() -> [ResultsDataModel] {
          return charactersDataInfo
        }

        func filterByStatus(characterStatus: String) -> [ResultsDataModel]{
            if(characterStatus == "Reset") {
                charactersDataInfo.removeAll()
                charactersDataInfo = filterdCharactersDataInfo
                return charactersDataInfo
            }
            charactersDataInfo = charactersDataInfo.filter{ $0.status == characterStatus}
            return charactersDataInfo
        }

        func shouldResetFilter(filterCellSelectedIndex: Int) -> [ResultsDataModel] {
           _ = clearFilterData()
           return (filterCellSelectedIndex >= 0) ? self.charactersDataInfo : []
        }

        func clearFilterData() -> [ResultsDataModel] {
            self.charactersDataInfo = self.filterdCharactersDataInfo
            return self.charactersDataInfo
        }

    func getStatusTypes(charactersData: [ResultsDataModel]) -> [String] {
        if (charactersData.count > 0) {
            for character in charactersData {
                filtersPerStatusArray.append(character.status ?? "")
            }
            filtersPerStatusArray = filtersPerStatusArray.uniqued()
            // Adding static cell to reset filter, to enable user view back the main data
            if(!filtersPerStatusArray.contains("Reset")){
                filtersPerStatusArray.append("Reset")
            }
              return filtersPerStatusArray
            } else {
              return []
          }
        }
    }
