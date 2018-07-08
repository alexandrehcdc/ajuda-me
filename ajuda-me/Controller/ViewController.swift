//
//  ViewController.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 5/13/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var indicatorsView: UIView!
    @IBOutlet weak var informationView: UIView!
    @IBOutlet weak var mainBtn: UIButton!
    
    @IBOutlet weak var unitsAvailableLabel: UILabel!
    @IBOutlet weak var agentsAvailableLabel: UILabel!
    @IBOutlet weak var ambulancesAvailableLabel: UILabel!
    
    
    @IBAction func mainBtnAction(_ sender: Any) {
        guard let number = URL(string: "tel://192") else { return }
        UIApplication.shared.open(number)
    }
    
    func setUnitsLabel (json: JSON) {
        self.unitsAvailableLabel.text = String(reflecting: json)
    }
    
    func setAgentsLabel (json: JSON) {
        self.agentsAvailableLabel.text = String(reflecting: json)
    }
    
    func setAmbulancesLabel (json: JSON) {
        self.ambulancesAvailableLabel.text = String(reflecting: json)
    }
    
    override func viewDidLoad() {
        
        if mainBtn != nil &&
           informationView != nil &&
           indicatorsView != nil
            {
            mainBtn = setMainButtonStyle(btn: mainBtn!)
            informationView = setViewUpperRoundCorners(view: informationView)
            indicatorsView = setViewCardShadows(view: indicatorsView)
                
            Caller.get(url: EndpointBuilder()
                .withAgent()
                .getPath(), setAgentsLabel)
            
            Caller.get(url: EndpointBuilder()
                .withBasesCount()
                .getPath(), setUnitsLabel)
            
            Caller.get(url: EndpointBuilder()
                .withAmbulance()
                .getPath(), setAmbulancesLabel)
        }
        
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Tipos de emergência"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlainCell", for: indexPath)
        
        cell.textLabel?.text = "Emergência exemplo"
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlainCell", for: indexPath)
        print(cell.textLabel!)
    }
    
}

