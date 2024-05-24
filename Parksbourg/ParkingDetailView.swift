//
//  ParkingDetailView.swift
//  Parksbourg
//
//  Created by Leon Le Berre on 5/24/24.
//

import Foundation
import SwiftUI

struct ParkingDetailView : View {
    let parking_id : String
   
    init(parking_id : String) {
        self.parking_id = parking_id
    }
    var body : some View {
        VStack {
            Text(self.parking_id)
        }
    }
}
