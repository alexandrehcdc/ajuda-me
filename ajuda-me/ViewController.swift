//
//  ViewController.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 5/13/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainBtn: UIButton!
    
    @IBAction func mainBtnAction(_ sender: Any) {
        guard let number = URL(string: "tel://10101010") else { return }
        UIApplication.shared.open(number)
        print("aqui")
    }
    
    override func viewDidLoad() {
        mainBtn.layer.cornerRadius = 20
        mainBtn.clipsToBounds = true
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

