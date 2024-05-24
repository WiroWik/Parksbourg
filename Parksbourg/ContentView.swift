//
//  ContentView.swift
//  Parksbourg
//
//  Created by Leon Le Berre on 5/17/24.
//

import SwiftUI
import Alamofire

struct DecodableType: Decodable {
    let total_count: Int
    let results: [[String : String?]]
                                                
    /*
    let city: String
    let friendyurl: String
    let districtcode: String
    let description: String
    let address: String
    let types: String
    let name: String
    let position: [String : Float]
    let idsurfs: String
    let zipcode: String
    let citycode: String
    let schedulelinkname: String
    let accessfordeficient: Int
    let accessforelder: Int
    let street: String
    let accessforwheelchair: Int
    let accessfordeaf: Int
    let normalizedalias: String
    let accessforblind: Int
    let schedulelinkurl: String
    let hasurlschedule: Int
     */
}



/*public class Parking {
    var id : Int
    var name : String
    var description : String
    var address : String
    var position : [String : Float]
    
    init(id: Int, name: String, description: String, address: String, position: [String : Float]) {
        self.id = id
        self.name = name
        self.description = description
        self.address = address
        self.position = position
    }
}*/



struct ContentView: View {
    @ObservedObject var viewModel: ParkingViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Parksbourg")
            NavigationView {
                List(viewModel.parkingList) { parking in
                    Text(parking.nom_parking)
                }
                .navigationTitle("Liste des Parkings")
                .onAppear {
                    viewModel.fetchData()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ParkingViewModel())
    }
}
