//
//  DogPicturesCollectionView.swift
//  idwall_desafios_iddog
//
//  Created by Lucas de Brito on 15/09/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import UIKit
import LBTAComponents

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
        return listaDeUrls.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DogPicCell
        cell.dogImageView.loadImage(urlString: listaDeUrls[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width/3) - 16, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
}
    // MARK: - Collection View Cell Configuration
class DogPicCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var dogImageView: CachedImageView = {
        let image = CachedImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 5
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomImageIn)))
        return image
    }()
    
    var startingFrame: CGRect?
    var blackBG: UIView?
    
    @objc func zoomImageIn(tapGesture: UITapGestureRecognizer){
        if let imageView = tapGesture.view as? UIImageView{
            startingFrame = imageView.superview?.convert(imageView.frame, to: nil)
            let zoomImageView = UIImageView(frame: startingFrame!)
            zoomImageView.isUserInteractionEnabled = true
            zoomImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomImageOut)))
            zoomImageView.image = imageView.image
            zoomImageView.contentMode = .scaleAspectFill
            if let keyWindow = UIApplication.shared.keyWindow {
                blackBG = UIView(frame:keyWindow.frame)
                blackBG?.backgroundColor = .black
                blackBG?.alpha = 0
                keyWindow.addSubview(blackBG!)
                keyWindow.addSubview(zoomImageView)
                
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.blackBG?.alpha = 1
                    let height = self.startingFrame!.height / self.startingFrame!.width * keyWindow.frame.width
                    zoomImageView.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height)
                    zoomImageView.center = keyWindow.center
                }, completion: nil)
            }
        }
    }
    
    @objc func zoomImageOut(tapGesture: UITapGestureRecognizer){
        if let zoomOutImageView = tapGesture.view{
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                zoomOutImageView.frame = self.startingFrame!
                self.blackBG?.alpha = 0
            }, completion: { (Completed) in
                zoomOutImageView.removeFromSuperview()
            })
        }
    }
    
    func setup(){
        self.backgroundColor = UIColor(r: 207, g: 207, b: 207)
        addSubview(dogImageView)
        dogImageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
}

