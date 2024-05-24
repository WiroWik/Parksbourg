import Foundation
import SwiftUI

func accessColor(hasAccess : Int) -> Color {
    if hasAccess == 1 {
        return Color.blue
    } else {
        return Color.gray
    }
}

struct ParkingDetailView : View {
    @ObservedObject var detailViewModel: ParkingDetailViewModel
    let parking_id : String
    init(parking_id : String, detailViewModel : ParkingDetailViewModel) {
        self.parking_id = parking_id
        self.detailViewModel = detailViewModel
    }
    
    var body : some View {
        let parking_data : ParkingDetail = detailViewModel.parking_data ?? ParkingDetail(city: "none", friendlyurl: "none", districtcode: "none", description: "none", address: "none", types: "none", name: "none", position: ["lon" : 0.0, "lat" : 0.0], idsurfs: "Loading...", zipcode: "none", citycode: "none", schedulelinkname: "none", accessfordeficient: 0, accessforelder: 0, street: "Loading...", accessforwheelchair: 0, accessfordeaf: 0, normalizedalias: "none", accessforblind: 0, schedulelinkurl: "none", hasurlschedule: 0)
        
        VStack {
            NavigationView {
                VStack(alignment: .leading) {
                    Text(parking_data.street).font(.title3)
                        .offset(x : 30)
                        .overlay(alignment: .leading) {
                            Image(systemName:"location").resizable().foregroundColor(.accentColor)
                            .frame(width: 20.0, height: 20.0)
                            
                        }
                    Divider()
                    Text(parking_data.description).font(.body)
                    Divider()
                    HStack {
                        Image(systemName : "person.circle")
                            .imageScale(.large)
                            .foregroundColor(accessColor(hasAccess: parking_data.accessforwheelchair))
                        Image(systemName : "person.badge.plus")
                            .imageScale(.large)
                            .foregroundColor(accessColor(hasAccess: parking_data.accessfordeaf))
                        Image(systemName : "person.wave.2")
                            .imageScale(.large)
                            .foregroundColor(accessColor(hasAccess: parking_data.accessforelder))
                        Image(systemName : "person.fill.xmark")
                            .imageScale(.large)
                            .foregroundColor(accessColor(hasAccess: parking_data.accessforblind))
                    }
                    Spacer()
                    
                }.padding(20)
            }
            .navigationTitle(parking_data.name)
            .onAppear {
                detailViewModel.fetchData(parking_id: self.parking_id)
            }
        }.frame(maxWidth: .infinity)
    }
}

struct ParkingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ParkingDetailView(parking_id: "2413_DEP_59", detailViewModel: ParkingDetailViewModel())
    }
}
