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
    var mainViewController: ViewController?

    @IBOutlet weak var detailsTxtView: UITextView!
    
    // helpCallGroup
    @IBOutlet weak var helpCallGroupView:   UIView!
    @IBOutlet weak var helpCallVehicleView: UIView!
    @IBOutlet weak var helpCallAgentView:   UIView!
    @IBOutlet weak var helpCallEntityView:  UIView!
    @IBOutlet weak var helpCallStatusView:  UIView!
    @IBOutlet weak var vehiclePic:          UIImageView!
    @IBOutlet weak var agentPic:            UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsTxtView      = setViewAsCard(view: detailsTxtView)
        detailsTxtView.text = detailText

        helpCallGroupView   = setViewAsCard(view: helpCallGroupView)
        helpCallGroupView   = setViewSimpleShadow(view: helpCallGroupView, color: UIColor.black.cgColor)
        
        helpCallVehicleView = setViewAsCard(view: helpCallVehicleView)
        helpCallAgentView   = setViewAsCard(view: helpCallAgentView)
        helpCallEntityView  = setViewAsCard(view: helpCallEntityView)
        helpCallStatusView  = setViewAsCard(view: helpCallStatusView)
        
        vehiclePic = setProfilePictureStyle(image: vehiclePic)
        agentPic   = setProfilePictureStyle(image: agentPic)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
