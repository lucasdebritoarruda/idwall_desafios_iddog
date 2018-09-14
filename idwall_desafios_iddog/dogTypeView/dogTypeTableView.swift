//
//  dogTypeTableView.swift
//  idwall_desafios_iddog
//
//  Created by Lucas de Brito on 14/09/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import UIKit

class DogTypeTableView: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    // MARK: - View Configuration
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupNavigationBar()
        setupTableView()
    }
    
    func setupNavigationBar(){
        navigationItem.title = "Dog Type"
        navigationController?.navigationBar.barTintColor = UIColor.customOrange
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 20)]
    }
    
    // MARK: - Table Configuration
    let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.allowsSelection = false
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dogTypeCell, for: indexPath) as! DogTypeCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

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
    
    func setup(){
        addSubview(cellView)
        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 4, paddingRight: 8)
    }
    
}
