//
//  ProfileViewController.swift
//  catstagram_ios
//
//  Created by Euna Ahn on 2022/04/30.
//

import UIKit

class ProfileViewController: UIViewController {
    // MARK: -properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()

    }
    //MARK: -Actions
    
    
    //MARK: -Helpers
    private func setupCollectionView(){
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        profileCollectionView.register(
            UINib(
                nibName: "ProfileCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
    }

}

//MARK: - UICollectionViewDelegate
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
    
}
