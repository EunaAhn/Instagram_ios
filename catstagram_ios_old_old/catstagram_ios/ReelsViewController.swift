//
//  ReelsViewController.swift
//  catstagram_ios
//
//  Created by Euna Ahn on 2022/05/12.
//

import UIKit

class ReelsViewController: UIViewController {
    // MARK: -Properties
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let videoURLStrArr = ["dummyVideo", "dummyVideo02"]
    
    
    // MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()

    }
    
    // MARK: - Actions
    
    
    // MARK: - Helpers
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ReelsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ReelsCollectionViewCell.identifier)
    }

}

extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCollectionViewCell.identifier, for: indexPath) as? ReelsCollectionViewCell else { fatalError() }
        return cell
    }
    
}

extension ReelsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}
