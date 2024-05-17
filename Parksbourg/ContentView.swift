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
    let results: [[String : AnyObject]]
                                                
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



public class Parking {
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
    
    static func populate() -> [Parking] {
        var parkingList = [Parking]()
        AF.request("https://data.strasbourg.eu/api/explore/v2.1/catalog/datasets/parkings/records?limit=32", method: .get).responseDecodable(of: DecodableType.self) { response in
                print(response)
        }
        
        return parkingList
    }
}




struct ContentView: View {
    var parkingList : [Parking] = Parking.populate()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Parksbourg")
            List(parkingList, id: \.id) { parking in
                VStack {
                    Text(parking.name)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
