//
//  ViewController.swift
//  Parksbourg
//
//  Created by Leon Le Berre on 5/24/24.
//

import Foundation
import Alamofire
import SwiftUI

struct ParkingDetail : Decodable {
    let city : String
    let friendlyurl : String
    let districtcode : String
    let description : String
    let address : String
    let types : String
    let name : String
    let position : [String : Float]
    let idsurfs : String
    let zipcode : String
    let citycode : String
    let schedulelinkname : String
    let accessfordeficient : Int
    let accessforelder : Int
    let street : String
    let accessforwheelchair : Int
    let accessfordeaf : Int
    let normalizedalias : String
    let accessforblind : Int
    let schedulelinkurl : String
    let hasurlschedule : Int
}

struct ParkingDetailResponse : Decodable {
    let total_count : Int
    let results : [ParkingDetail]
}

struct ParkingDetailIdentifiable : Identifiable {
    let id : Int
    
    let city : String
    let friendlyurl : String
    let districtcode : String
    let description : String
    let address : String
    let types : String
    let name : String
    let position : [String : Float]
    let idsurfs : String
    let zipcode : String
    let citycode : String
    let schedulelinkname : String
    let accessfordeficient : Int
    let accessforelder : Int
    let street : String
    let accessforwheelchair : Int
    let accessfordeaf : Int
    let normalizedalias : String
    let accessforblind : Int
    let schedulelinkurl : String
    let hasurlschedule : Int
}

class ParkingDetailViewModel: ObservableObject {
    @Published var parking_data : ParkingDetail?
    
    
    func fetchData(parking_id : String) {
        let urlString = "https://data.strasbourg.eu/api/explore/v2.1/catalog/datasets/parkings/records?where=idsurfs%3D%22\(parking_id)%22&limit=32"
        AF.request(urlString)
            .validate() // Pour valider les réponses HTTP 200..<300 et les erreurs de contenu
            .responseDecodable(of: ParkingDetailResponse.self) { response in // Notez le type [User].self ici
                switch response.result {
                case .success(let parkingResponse):
                    let parkings = parkingResponse.results
                    self.parking_data = parkings[0]
                    print(self.parking_data)
                    
                case .failure(let error):
                    print("Erreur : \(error)")
                }
        }
    }
}

struct ParkingDetailViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ParkingViewController {
        // Retourne une instance de ParkingViewController
        return ParkingViewController()
    }

    func updateUIViewController(_ uiViewController: ParkingViewController, context: Context) {
        // Met à jour le ViewController s'il y a des changements
    }
}

class ParkingDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}


