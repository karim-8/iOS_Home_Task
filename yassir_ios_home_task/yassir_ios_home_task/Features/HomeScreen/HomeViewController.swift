//
//  ListHomeViewController.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 06/07/2024.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK:- OUTLETS
    @IBOutlet var filtersCollectionView: UICollectionView!
    @IBOutlet var charactersTableView: UITableView!

    //MARK:- VARIABLES
    var viewModel: HomeViewModel?
    // Filter Array By Status "Alive","Dead","Unknown"
    var filtersPerStatusArray = [String]()
    var currentPage = 1
    var isPaginating = false
    var shouldStopPaginating = false
    var filterCellSelectedIndex = -1
    var isFilteredAdded = false
    var charactersDataInfo = [ResultsDataModel]()
    var FilterdCharactersDataInfo = [ResultsDataModel]()
    var spinner = UIActivityIndicatorView()
    var homeUseCase: HomeUseCase?  
    var repo: HomeRepository?
    var coordinator = HomeCoordinator()


    // MARK:- VIEW WILL APPEAR
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        navBarSetup()
        collectionViewSetup()
        characterTableViewSetup()
        getCharactersInformation(pageNumber: currentPage)
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
        createSpinnerFooter()
        homeUseCase = HomeUseCase(repository: repo ?? HomeRepository(networkClient: NetworkClient()))
        viewModel = HomeViewModel(coordinator: coordinator,
                                  useCase: homeUseCase!)
        charactersTableView.register(CharacterTableViewCell.nib(), forCellReuseIdentifier: CharacterTableViewCell.identifier)
        charactersTableView.separatorStyle = .none
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
    }
    //MARK:- GET CHARACTERS INFORMATION
    func getCharactersInformation(pageNumber: Int) {
        print("I have been called with page number \(pageNumber)")
        spinner.startAnimating()
        isPaginating = true

        viewModel?.getCharacterInfo(pageNumber: pageNumber)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            _ = self.viewModel?.getCharactersData()
            self.charactersDataInfo = self.viewModel?.getCharactersData() ?? []
            self.FilterdCharactersDataInfo = self.charactersDataInfo
            self.filtersPerStatusArray = self.viewModel?.getStatusTypes(charactersData: self.charactersDataInfo) ?? []

            // Todo: Seperate logic
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.spinner.stopAnimating()
            }
            // Todo: Seperate logic

            DispatchQueue.main.async {
                self.isPaginating = false
                self.charactersTableView.reloadData()
                    // Get Filter types for the first time only and reload the data as per they constant
                if(!self.isFilteredAdded) {
                    self.filtersCollectionView.reloadData()
                    self.isFilteredAdded = true
                }
            }
        }
    }
    //MARK:- FILTER CHARACTER PER STATUS
    func filterCharacterPerStatus(characterStatus: String) {
        // Clear filters in view model
       _ = viewModel?.shouldResetFilter(filterCellSelectedIndex: filterCellSelectedIndex)

        charactersDataInfo = viewModel?.filterByStatus(characterStatus: characterStatus) ?? []

        DispatchQueue.main.async {
            self.charactersTableView.reloadData()
        }
    }
    //MARK:- CLEAR FILTER DATA
    func clearFilterData() {
         self.charactersDataInfo = self.FilterdCharactersDataInfo
    }
   // MARK:- UPDATE MAIN VIEW
    func updateMainView(){
        DispatchQueue.main.async {
            self.charactersTableView.reloadData()
        }
    }

    //MARK:- CREATE SPINNER FOOTER
    private func createSpinnerFooter()  {
        spinner.center = self.view.center
        spinner.hidesWhenStopped = true
        spinner.style = UIActivityIndicatorView.Style.medium
        view.addSubview(spinner)
    }
    //MARK:- DEINIT
    deinit {
        print("Home View Controller deinit Called")
        viewModel = nil
        homeUseCase = nil
        repo = nil
    }
}
