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
    private var nowPage = 0
    
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
        collectionView.decelerationRate = .fast
        collectionView.register(ReelsCell.self, forCellWithReuseIdentifier: ReelsCell.identifier)
        
        startLoop()
    }
    
    private func startLoop(){
        let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            self.moveNextPage()
        }
    }
    
    private func moveNextPage() {
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        nowPage += 1
        if (nowPage >= itemCount) {
            nowPage = 0
        }
        
        collectionView.scrollToItem(
            at: IndexPath(item: nowPage, section: 0),
            at: .centeredVertically,
            animated: true)
    }

}

extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCell.identifier, for: indexPath) as? ReelsCell else { return UICollectionViewCell() }
        cell.setupURL(videoURLStrArr.randomElement()!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCell {
            cell.videoView?.cleanup()
        }
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
