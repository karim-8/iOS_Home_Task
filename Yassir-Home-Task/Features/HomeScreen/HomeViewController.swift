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
    var filtersItemsArray = ["Alive","Dead","Unknown"]
    var charactersNames = ["Zephyr", "Aurora", "Throne", "Lyra"]
    var charactersNamesDesc = ["Elf", "Human", "Dwarf", "Faerie"]

    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        navBarSetup()
        collectionViewSetup()
        characterTableViewSetup()
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
        // Spacing Between Collection Cell
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
}
