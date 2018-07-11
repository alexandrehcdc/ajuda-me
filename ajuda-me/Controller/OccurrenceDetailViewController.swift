//
//  OccurrenceDetailViewController.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 7/10/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import UIKit

class OccurrenceDetailViewController: UIViewController {
    
    var detailText = ""

    @IBOutlet weak var detailsTxtView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsTxtView = setViewUpperRoundCorners(view: detailsTxtView)
        detailsTxtView.text = detailText
        print(" marreco \(detailText) ")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
