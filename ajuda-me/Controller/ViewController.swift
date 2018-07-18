//
//  ViewController.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 5/13/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift
import MapKit
import CoreLocation

class ViewController: UIViewController,
                      UITableViewDataSource,
                      UITableViewDelegate,
                      CLLocationManagerDelegate {
    
    // views
    @IBOutlet weak var indicatorsView:  UIView!
    @IBOutlet weak var informationView: UIView!
    
    // buttons
    @IBOutlet weak var mainBtn:     UIButton!
    @IBOutlet weak var historyBtn:  UIButton!
    @IBOutlet weak var openDataBtn: UIButton!
    @IBOutlet weak var profileBtn:  UIButton!
    
    
    
    // labels
    @IBOutlet weak var unitsAvailableLabel:      UILabel!
    @IBOutlet weak var agentsAvailableLabel:     UILabel!
    @IBOutlet weak var ambulancesAvailableLabel: UILabel!
    
    // variables
    var detailTxt: String?
    var screenId:  String?
    
    let occurencesDataSource = OccurrencesLocalDataSourceImpl.getInstance(realm: try! Realm())
    var occurencesOptions    = [Occurrence]()
    let occurrences          = getOccurenceList()
    let userLocation         = CLLocationManager()
    
    @IBAction func mainBtnAction(_ sender: Any) {
        guard let number = URL(string: "tel://192") else { return }
        UIApplication.shared.open(number)
    }
    
    @IBAction func historyClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "historyView") as! HistoryViewController
        present(vc, animated: true, completion: nil)
    }
    @IBAction func openDataClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "indicatorsView") as! IndicatorsViewController
        present(vc, animated: true, completion: nil)
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
        
        let sploader = ServicePointLoader()
        let hcloader = HelpCallsLoader()
        hcloader.LoadMapPoints()
        sploader.LoadMapPoints()
        
        self.occurencesOptions = occurencesDataSource.findAll()
        
        if mainBtn != nil {
            
            mainBtn     = setMainButtonStyle(btn: mainBtn!)
            historyBtn  = setLowerButtonStyle(btn: historyBtn!)
            openDataBtn = setLowerButtonStyle(btn: openDataBtn!)
            profileBtn  = setLowerButtonStyle(btn: profileBtn!)
            
            informationView = setViewUpperRoundCorners(view: informationView)
            indicatorsView  = setViewCardShadows(view: indicatorsView)
            indicatorsView  = setViewAsCard(view: indicatorsView)
            indicatorsView  = setViewSimpleShadow(view: indicatorsView,
                                                  color: UIColor.black.cgColor)
                
            Caller.get(url: EndpointBuilder()
                .withAgent()
                .getPath(), setAgentsLabel)
            
            Caller.get(url: EndpointBuilder()
                .withBasesCount()
                .getPath(), setUnitsLabel)
            
            Caller.get(url: EndpointBuilder()
                .withAmbulance()
                .getPath(), setAmbulancesLabel)
            
            let parameters: [String: Any] = [
                "IdQuiz" : 102,
                "IdUser" : "iosclient"
            ]
            
            func ue(val: JSON) {
                print("funfou \(val)")
            }
            
            Caller.post(url: "https://whispering-lowlands-23613.herokuapp.com/teste", parameters: parameters, ue)
        }
        
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        screenId = "occurrence"
        return "Tipos de emergência"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.occurrences.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlainCell", for: indexPath)
        
        cell.textLabel?.text = self.occurrences[indexPath.row]
        
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath)
        detailTxt = currentCell?.textLabel?.text

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "teste" && screenId == "occurrence" {
            let vc = segue.destination as? OccurrenceDetailViewController
            var detailTxt = sender as? String
            vc?.detailText = """
            Sempre que possível devemos pedir e aceitar a colaboração de outras pessoas, sempre deixando que o indivíduo com maior conhecimento e experiência possa liderar, dando espaço para que o mesmo demonstre à cada uma, com calma e firmeza o que deve ser feito, de forma rápida, correta e precisa.
            
            Segundo o Art. 135 do Código Penal Brasileiro, deixar de prestar socorro à vítima de acidentes ou pessoas em perigo eminente, podendo fazê-lo, é crime, mesmo que a pessoa não seja a causadora do evento.
            
            
            Atitudes corretas:
            
            1) A calma, o bom-senso e o discernimento são elementos primordiais neste tipo de atendimento.
            
            2) Agir rapidamente, porém respeitando os seus limites e o dos outros.
            
            3) Transmitir á(s) vítima(s), tranqüilidade, alívio, confiança e segurança, e quando estiverem conscientes informar-lhes que o atendimento especializado está a caminho.
            
            4) Utilize-se de conhecimentos básicos de primeiros socorros, improvisando se necessário.
            
            5)Nunca tome atitudes das quais não tem conhecimento, no intuito de ajudar, apenas auxilie dentro de sua capacidade.
            """
        }

    }
    
}

