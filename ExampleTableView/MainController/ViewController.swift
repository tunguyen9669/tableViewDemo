//
//  ViewController.swift
//  ExampleTableView
//
//  Created by admin on 9/24/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var functions = [Function]()
    
    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTable()
        navigationItem.title = "Settings"
        initData()
        print(functions[0].title)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initData() {
        self.functions = [Function(#imageLiteral(resourceName: "music-melody"), "Tunes"), Function(#imageLiteral(resourceName: "idea"), "Genius"), Function(#imageLiteral(resourceName: "add-to-cart"), "Purchased"), Function(#imageLiteral(resourceName: "cloud-computing"), "Downloaded")]

    }
    func registerTable() {
        mainTableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return functions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MainTableViewCell = mainTableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell else {
            return UITableViewCell()
        }
        let index = functions[indexPath.row]
        cell.titleLabel.text = index.title
        cell.tiltleImageView.image = index.avatar
        cell.separatorView.backgroundColor = UIColor.gray
        return cell
    }
    
    
}

