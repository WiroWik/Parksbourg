import SwiftUI
import Alamofire



struct LandingView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack {
                    Image(systemName: "car")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Parksbourg").font(.title)
                }
                NavigationLink(destination: ContentView(viewModel: ParkingViewModel())) {
                    Image(systemName: "arrow.right.circle")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
            }
        }
    }
    
}


struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}

