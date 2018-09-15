//
//  DogPicturesCollectionView.swift
//  idwall_desafios_iddog
//
//  Created by Lucas de Brito on 15/09/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import UIKit

class DogPicturesCollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var dogType: String = " "
    var listaDeUrls: [String] = []
    let cellId = "cellId"
    
    // MARK: - View Configuration
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(r: 207, g: 207, b: 207)
        setupNavigationBar()
        collectionView?.register(DogPicCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func setupNavigationBar(){
        navigationItem.title = dogType.capitalized
        navigationController?.navigationBar.barTintColor = UIColor.customOrange
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 20)]
    }
    
    // MARK: - Collection View Configuration
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DogPicCell
        cell.dogImageView.image = UIImage(named:"pug")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width/3) - 16, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
}

class DogPicCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let dogImageView:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 5
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.customOrange.cgColor
        return image
    }()
    
    
    func setup(){
        self.backgroundColor = UIColor(r: 207, g: 207, b: 207)
        addSubview(dogImageView)
        dogImageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
}
