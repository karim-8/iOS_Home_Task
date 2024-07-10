//
//  ListHomeViewController.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 06/07/2024.
//

import UIKit

enum urlEndPoint: String {
    case baseUrl = "https://rickandmortyapi.com/api/character/"
}

struct request: RequestProtocol {
    let baseUrl: String?
    let qParameters: String?

    init(url: String, param: String){
        self.baseUrl = url
        self.qParameters = param
    }
    var url: URL {
        return URL(string: baseUrl! + qParameters!)!
    }


}


class HomeViewController: UIViewController {

    //MARK:- OUTLETS
    @IBOutlet var filtersCollectionView: UICollectionView!
    @IBOutlet var charactersTableView: UITableView!

    //MARK:- VARIABLES
    var viewModel: HomeViewModel?
    var filtersItemsArray = ["Alive","Dead","Unknown"]
    var charactersNames = ["Zephyr", "Aurora", "Throne", "Lyra"]
    var charactersNamesDesc = ["Elf", "Human", "Dwarf", "Faerie"]
    var coordinator = HomeCoordinator()
    var currentPage = 1



   /// Todo update
    var charactersDataInfo = [ResultsDataModel]()


    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        navBarSetup()
        collectionViewSetup()
        characterTableViewSetup()
        getUsersData(pageNumber: currentPage)
    }

    //MARK:- NAVIGATION BAR SETUP
    func navBarSetup() {
        navigationBarSetup(navigationController: navigationController ?? UINavigationController())
    }

    //MARK:- COLLECTION VIEW SETUP
    func collectionViewSetup() {
        //Cell Register
        filtersCollectionView.register(FilterCollectionViewCell.nib(), forCellWithReuseIdentifier: FilterCollectionViewCell.identifier)
        filtersCollectionView.delegate = self
        filtersCollectionView.dataSource = self
        //Cell Configuration
        let layout = UICollectionViewFlowLayout()
        filtersCollectionView.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
        filtersCollectionView.showsHorizontalScrollIndicator = false
        // Spacing Between Collectioncell
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
    }

    //MARK:- CHARACTER TABLE VIEW SETUP
    func characterTableViewSetup() {
        charactersTableView.register(CharacterTableViewCell.nib(), forCellReuseIdentifier: CharacterTableViewCell.identifier)
        charactersTableView.separatorStyle = .none
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
    }
    // Todo:- Add more data to the current array and move the logic to View Model
        //MARK:- GET USER DATA
    func getUsersData(pageNumber: Int) {
        let parameters = "?page=\(pageNumber)"
        //let parameters = ""
        let fullUrl = request(url: urlEndPoint.baseUrl.rawValue, param: parameters)


        NetworkClient().get(url: fullUrl) { [weak self] result in
            switch result {
            case .success(let data):
                print("Data from the view model is.....\(data)")
                self?.decodeJsonResult(jsonData: data)
            case .failure(let error):
                print("Error while fetchhing data...\(error)")
            }
        }
    }

        //MARK:- DECODE JSON RESULT
    private func decodeJsonResult(jsonData: Data) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970

        let userdata = try? decoder.decode(CharactersDataModel.self, from: jsonData)
        if let data = userdata {
            self.charactersDataInfo = data.results ?? []
            charactersTableView.reloadData()
            print(data)
        }
    }

        //////////////////////////////////////////////////////////////////////////////////////
    deinit {
        print("I have been called")
    }
}
