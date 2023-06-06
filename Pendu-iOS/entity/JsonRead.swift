//
//  JsonRead.swift
//  Pendu-iOS
//
//  Created by Louis Lubineau on 30/05/2023.
//

import UIKit

class JsonRead {
    
    static func readJSONFile() -> String {
        do {
            if let fileUrl = Bundle.main.url(forResource: "liste-mots", withExtension: "json") {
                let jsonData = try Data(contentsOf: fileUrl)
                let mots = try JSONDecoder().decode([String].self, from: jsonData)
                
                if let motAleatoire = mots.randomElement() {
                    print("Mot aléatoire :", motAleatoire)
                    return motAleatoire
                } else {
                    print("Le tableau de mots est vide.")
                }
            } else {
                print("Fichier JSON introuvable.")
            }
        } catch {
            print("Erreur lors de la lecture du fichier JSON :", error.localizedDescription)
        }
        return "error"
    }

}
