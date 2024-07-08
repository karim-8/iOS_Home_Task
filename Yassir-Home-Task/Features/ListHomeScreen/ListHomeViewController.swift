//
//  ListHomeViewController.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 06/07/2024.
//

import UIKit

class ListHomeViewController: UIViewController {

    //MARK:- OUTLETS
    @IBOutlet var filtersCollectionView: UICollectionView!
    @IBOutlet var charactersTableView: UITableView!


    //MARK:- VARIABLES
    var viewModel: ListHomeViewModel?
    var itemsArray = ["Alive","Dead","Unknown"]

    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        collectionViewSetup()
        navBarSetup()
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

    }

    func characterTableViewSetup() {
        charactersTableView.register(CharacterTableViewCell.nib(), forCellReuseIdentifier: CharacterTableViewCell.identifier)
        charactersTableView.separatorStyle = .none
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
    }
}

extension ListHomeViewController: UITableViewDelegate {


}

extension ListHomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as! CharacterTableViewCell

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}



///// ///////////////////////////////////////////////////////////////////////
extension ListHomeViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filtersCollectionView.deselectItem(at: indexPath, animated: true)
      
        print("The  index \(indexPath.row) have been Tapped")
    }
}

extension ListHomeViewController: UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = filtersCollectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as! FilterCollectionViewCell

        cell.configure(with: itemsArray[indexPath.row])
        cell.layer.borderWidth = 1
        cell.layer.masksToBounds = false
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 15.0
        cell.layer.masksToBounds = true

        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsArray.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}


extension ListHomeViewController: UICollectionViewDelegateFlowLayout {

    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemWidth: CGFloat = ((collectionView.bounds.size.width)  / CGFloat(3.0))
                    return CGSize( width: itemsArray[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]).width + 25, height: 30)

//        return CGSize(width: itemsArray[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]).width + 25, height: 30)
    }
}

/*
 override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
 return UITableViewAutomaticDimension
 }

 override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
 return UITableViewAutomaticDimension
 }
 */
