//
//  ViewController.swift
//  Parksbourg
//
//  Created by Leon Le Berre on 5/24/24.
//

import Foundation
import Alamofire
import SwiftUI

struct Parking : Decodable {
    let nom_parking : String
    let idsurfs : String
    let ident : Int
    let etat : Int
    let etat_descriptif : String
    let total : Int
    let libre : Int
    let infousager : Int?
    let realtimestatus : String
    let infoappli : String
}

struct ParkingResponse : Decodable {
    let total_count : Int
    let results : [Parking]
}

struct ParkingIdentifiable : Identifiable {
    let id: Int
    
    let nom_parking : String
    let idsurfs : String
    let ident : Int
    let etat : Int
    let etat_descriptif : String
    let total : Int
    let libre : Int
    let infousager : Int?
    let realtimestatus : String
    let infoappli : String
}

class ParkingViewModel: ObservableObject {
    @Published var parkingList: [ParkingIdentifiable] = []
    
    func fetchData() {
        let urlString = "https://data.strasbourg.eu/api/explore/v2.1/catalog/datasets/occupation-parkings-temps-reel/records?limit=20"
        AF.request(urlString)
            .validate() // Pour valider les réponses HTTP 200..<300 et les erreurs de contenu
            .responseDecodable(of: ParkingResponse.self) { response in // Notez le type [User].self ici
                switch response.result {
                case .success(let parkingResponse):
                    let parkings = parkingResponse.results
                    var index : Int = 0
                    for parking in parkings {
                        print(parking)
                        self.parkingList.append(ParkingIdentifiable(id: index, nom_parking: parking.nom_parking, idsurfs: parking.idsurfs, ident: parking.ident, etat: parking.etat, etat_descriptif: parking.etat_descriptif, total: parking.total, libre: parking.libre, infousager: parking.infousager, realtimestatus: parking.realtimestatus, infoappli: parking.infoappli))
                        index += 1
                    }
                case .failure(let error):
                    print("Erreur : \(error)")
                }
        }
    }
}

struct ParkingViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ParkingViewController {
        // Retourne une instance de ParkingViewController
        return ParkingViewController()
    }

    func updateUIViewController(_ uiViewController: ParkingViewController, context: Context) {
        // Met à jour le ViewController s'il y a des changements
    }
}

class ParkingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

