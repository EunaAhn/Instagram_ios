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
        //delegate 연결
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        //cell 등록
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else{
//            return UICollectionViewCell()
            fatalError("샐 타입 캐스팅 실패...")
        }
        return cell
    }
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CGFloat(159))
    }
}
