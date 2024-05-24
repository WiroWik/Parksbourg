//
//  ParkingDetailView.swift
//  Parksbourg
//
//  Created by Leon Le Berre on 5/24/24.
//

import Foundation
import SwiftUI

struct ParkingDetailView : View {
    @ObservedObject var detailViewModel: ParkingDetailViewModel
    let parking_id : String
    init(parking_id : String, detailViewModel : ParkingDetailViewModel) {
        self.parking_id = parking_id
        self.detailViewModel = detailViewModel
    }
    
    var body : some View {
        let parking_data : ParkingDetail = detailViewModel.parking_data ?? ParkingDetail(city: "none", friendlyurl: "none", districtcode: "none", description: "none", address: "none", types: "none", name: "none", position: ["lon" : 0.0, "lat" : 0.0], idsurfs: "none", zipcode: "none", citycode: "none", schedulelinkname: "none", accessfordeficient: 0, accessforelder: 0, street: "none", accessforwheelchair: 0, accessfordeaf: 0, normalizedalias: "none", accessforblind: 0, schedulelinkurl: "none", hasurlschedule: 0)
        VStack {
            Text(self.parking_id)
            NavigationView {
                VStack {
                    Text(parking_data.name)
                }
            }
            .onAppear {
                detailViewModel.fetchData(parking_id: self.parking_id)
            }
        }
    }
}

struct ParkingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ParkingDetailView(parking_id: "2413_DEP_59", detailViewModel: ParkingDetailViewModel())
    }
}
