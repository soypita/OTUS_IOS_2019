//
//  FirstViewController.swift
//  Homework1
//
//  Created by Дмитрий Сазонов on 12/09/2019.
//  Copyright © 2019 Дмитрий Сазонов. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellId = "cellId"
    @IBOutlet weak var tableView: UITableView!
    
    var testData: [String] {
        var arr = Array<String>()
        for i in 0..<20 {
            arr.append("Item\(i)")
        }
        return arr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId)!
        cell.textLabel?.text = self.testData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController!.pushViewController(detailVC, animated: true)
    }
}
