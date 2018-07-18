//
//  IndicatorsViewController.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 7/12/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift

class IndicatorsViewController: UIViewController,
                                UITableViewDataSource,
                                UITableViewDelegate  {

    
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var chamadosLabel: UILabel!
    @IBOutlet weak var chamadosCapitalLabel: UILabel!
    @IBOutlet weak var chamadosInteriorLabel: UILabel!
    @IBOutlet weak var acidentesLabel: UILabel!
    @IBOutlet weak var tempoMedioLabel: UILabel!
    @IBOutlet weak var viaturasLabel: UILabel!
    
    var allOccurrences = [HelpRequest]()
    let realm = try! Realm()
    var helpCallsDataSource : HelpRequestDataSourceImpl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helpCallsDataSource = HelpRequestDataSourceImpl.getInstance(realm: realm)
        
        allOccurrences = (helpCallsDataSource?.findAll())!
        
        chamadosLabel.text = String(allOccurrences.count)
        chamadosInteriorLabel.text = String(allOccurrences.count)
        
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
        
        cell.textLabel?.text = ("Chamado \(allOccurrences[indexPath.row].callerId)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Ultimos chamados"
    }
    
    func occurenceFactory(response: JSON) -> Void {
        
        for (_, obj) in response {
//            allOccurrences.append("Chamado \(obj["_id"].stringValue)")
        }
        
    }

}
