//
//  OnbordingViewController.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 17.05.2021.
//

import UIKit

class OnbordingViewController: UIViewController {

    var viewModel: OnbordingViewModelProtocol!
    var router: OnbordingRouterProtocol!
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func createCollection() {
        collection.register(UINib(nibName: "OnbordingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnbordingCollectionViewCell")
        
        collection.dataSource = self
        collection.delegate = self
    }

}

extension OnbordingViewController: UICollectionViewDelegate {
    
}

extension OnbordingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath) as! OnbordingCollectionViewCell
        
        return cell
    }
}
