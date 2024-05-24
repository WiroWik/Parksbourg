//
//  ParksbourgApp.swift
//  Parksbourg
//
//  Created by Leon Le Berre on 5/17/24.
//

import SwiftUI

@main
struct ParksbourgApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ParkingViewModel())
        }
    }
}
