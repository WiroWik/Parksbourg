//
//  ContentView.swift
//  Parksbourg
//
//  Created by Leon Le Berre on 5/17/24.
//

import SwiftUI
import Alamofire

enum ColorStatus : String {
    case GREEN = "GREEN"
    case ORANGE = "ORANGE"
    case RED = "RED"
    case BLUE = "BLUE"
}

func getStatusColor(color : String) -> Color {
    switch color {
        case ColorStatus.GREEN.rawValue:
                return Color.green
                
        case ColorStatus.ORANGE.rawValue:
                return Color.orange
        case ColorStatus.RED.rawValue:
                return Color.red
        case ColorStatus.BLUE.rawValue:
                return Color.blue
        default:
            return Color.gray
    }
}

struct ContentView: View {
    @ObservedObject var viewModel: ParkingViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "car")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Parksbourg")
            NavigationView {
                List(viewModel.parkingList) { parking in
                    let colorStatus : Color = getStatusColor(color : parking.realtimestatus)
                    NavigationLink(destination: ParkingDetailView(parking_id: parking.idsurfs, detailViewModel: ParkingDetailViewModel())) {
                        VStack(alignment: .leading) {
                            Text(parking.nom_parking)
                                .offset(x : 20)
                                .overlay(alignment: .leading) {
                                    Image(systemName:"circle.fill").resizable().foregroundColor(colorStatus)
                                        .frame(width: 10.0, height: 10.0)
                                    
                                }
                            Text("\(parking.libre) places libres").font(.subheadline).foregroundColor(.gray)
                        }
                    }
                }
            }
                .navigationTitle("Liste des Parkings")
                .onAppear {
                    viewModel.fetchData()
                }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ParkingViewModel())
    }
}
