//
//  OccurrenceBuilder.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 7/8/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation

public func getOccurenceList() -> [String] {
    return ["Me envolvi em um acidente",
            "Estou socorrendo alguém",
            "Tenho dores fortes",
            "Sofri um acidente de trabalho",
            "Presenciei acidentes de terceiros",
            "Presenciei algum desastre natural",
            "Outros"]
}

public func getOccurrenceDetail(occurrence: String) -> String {
    let cases = ["Me envolvi em um acidente" : "Mantenha-se calmo enquanto o socorro está a caminho, evite movimentos bruscos e tente sinalizar sua necessidade de socorro.\n",
                 "Estou socorrendo alguém" : "Caso a pessoa esteja consciente ou não, verifique os seguintes pontos:\n Verifique se o ambiente oferece riscos a você e a terceiros;\nProcure manter-se calmo(a) enquanto aguarda socorro;\n",
                 "Tenho dores fortes" : "Procure-se manter calmo e tente detalhar local, intensidade e frequência de suas dores",
                 "Sofri um acidente de trabalho" : "Procure-se manter calmo, e dependendo da causa do acidente, proteja-se em local abrigado caso seja por fatores ambientais, ou evite movimentos bruscos em causa de acidente mecânico e operacional.",
                 "Presenciei acidentes de terceiros" : "Caso a pessoa esteja consciente ou não, verifique os seguintes pontos:\n Verifique se o ambiente oferece riscos a você e a terceiros;\nProcure manter-se calmo(a) enquanto aguarda socorro;\n",
                 "Presenciei algum desastre natural" : "Se o ambiente oferecer algum tipo de risco a sua saúde, proteja-se em algum espaço abrigado e seguro, e em caso de ferimentos evite movimentos bruscos enquanto aguarda uma equipe de primeiro-socorros.",
                 "Outros": " É fundamental manter-se calmo enquanto uma equipe de primeiros-socorros está a caminho, para evitar agravantes e complicações em relação a sua saúde."]
    
    if let occurrenceDetail = cases[occurrence] {
        return occurrenceDetail
    } else {
        return ""
    }
}
