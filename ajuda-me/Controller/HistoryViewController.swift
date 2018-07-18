//
//  HistoryViewController.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 7/12/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController,
                             UITableViewDataSource,
                             UITableViewDelegate {
    
    var allOccurrences = [HelpRequest]()
    let realm = try! Realm()
    var helpCallsDataSource : HelpRequestDataSourceImpl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helpCallsDataSource = HelpRequestDataSourceImpl.getInstance(realm: realm)
        
        allOccurrences = (helpCallsDataSource?.findAll())!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allOccurrences.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlainCell", for: indexPath)
        
        cell.textLabel?.text = "Chamado de \(allOccurrences[indexPath.row].timestamp)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Histórico de chamados"
    }


}
