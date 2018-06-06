//
//  ViewController.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 5/13/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mainBtn: UIButton!
    
    @IBAction func mainBtnAction(_ sender: Any) {
        guard let number = URL(string: "tel://192") else { return }
        UIApplication.shared.open(number)
    }
    
    override func viewDidLoad() {
        mainBtn.layer.cornerRadius = 20
        mainBtn.clipsToBounds = true
        
        Caller.get(url: "https://whispering-lowlands-23613.herokuapp.com/locations")
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
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
    
}

