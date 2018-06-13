//
//  ViewController.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 5/13/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mainBtn: UIButton!
    @IBOutlet weak var mapsViewObject: UIView!
    
    @IBAction func mainBtnAction(_ sender: Any) {
        guard let number = URL(string: "tel://192") else { return }
        UIApplication.shared.open(number)
    }
    
    override func viewDidLoad() {
        
        if mainBtn != nil {
            mainBtn = setMainButtonStyle(btn: mainBtn!)
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

