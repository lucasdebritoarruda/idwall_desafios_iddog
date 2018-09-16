//
//  dogTypeTableView.swift
//  idwall_desafios_iddog
//
//  Created by Lucas de Brito on 14/09/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class DogTypeTableView: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var dogTypes = ["pug","labrador","husky","hound"]
    
    // MARK: - View Configuration
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(r: 207, g: 207, b: 207)
        setupNavigationBar()
        setupTableView()
    }
    
    func setupNavigationBar(){
        navigationItem.title = "Choose your favorite!"
        navigationController?.navigationBar.barTintColor = UIColor.customOrange
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 20)]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "LogOut", style: .plain, target: self, action: #selector(logOut))
    }
    
    @objc func logOut(){
        UserDefaultsManager.shared.isLoggedIn = false
        UserDefaultsManager.shared.token = ""
        let loginController = UINavigationController(rootViewController: LoginController())
        present(loginController, animated: true, completion: nil)
    }
    
    // MARK: - Table Configuration
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(r: 207, g: 207, b: 207)
        table.separatorStyle = .none
        //table.allowsSelection = false
        return table
    }()
    
    let dogTypeCell = "dogTypeCell"
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DogTypeCell.self, forCellReuseIdentifier: dogTypeCell)
        view.addSubview(tableView)
        tableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    // MARK: - Table View Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dogTypeCell, for: indexPath) as! DogTypeCell
        cell.dogImgView.image = UIImage(named: dogTypes[indexPath.row])
        cell.titleLabel.text = dogTypes[indexPath.row].capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: - Navigation
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.allowsSelection = false
        let layout = UICollectionViewFlowLayout()
        let dogPicturesCV = DogPicturesCollectionView(collectionViewLayout: layout)
        dogPicturesCV.dogType = dogTypes[indexPath.row]
        let token = UserDefaultsManager.shared.token
        self.getFeed(token: token,typeOfDog: dogTypes[indexPath.row]) { (urls) in
            dogPicturesCV.listaDeUrls = urls
            self.navigationController?.pushViewController(dogPicturesCV, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
            tableView.allowsSelection = true
        }
    }
    
    func getFeed(token:String,typeOfDog:String,completion: @escaping ([String]) -> Void){
        let header: HTTPHeaders = ["Authorization" : token]
        let url = "https://api-iddog.idwall.co/feed?category=" + typeOfDog
        Alamofire.request(url, headers: header).responseJSON { (response) in
            guard response.result.isSuccess,
                let value = response.result.value else{
                    print("Error while fetching tags: \(String(describing: response.result.error))")
                    return
            }
            let urls = JSON(value)["list"].arrayObject as? [String]
            completion(urls!)
        }
    }
    
}

    // MARK: - Custom Cell Configuration
class DogTypeCell: UITableViewCell{
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setCellShadow()
        return view
    }()
    
    var dogImgView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.layer.masksToBounds = true
        imageview.layer.cornerRadius = 20
        imageview.layer.borderWidth = 2
        imageview.layer.borderColor = UIColor.customOrange.cgColor
        return imageview
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sei la"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    func setup(){
        backgroundColor = UIColor(r: 207, g: 207, b: 207)
        addSubview(cellView)
        cellView.addSubview(dogImgView)
        cellView.addSubview(titleLabel)
        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 4, paddingRight: 8)
        dogImgView.setAnchor(top: nil, left: cellView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        dogImgView.centerYAnchor.constraint(equalTo:cellView.centerYAnchor).isActive = true
        titleLabel.setAnchor(top: nil, left: dogImgView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 40)
        titleLabel.centerYAnchor.constraint(equalTo:dogImgView.centerYAnchor).isActive = true
    }
    
}
