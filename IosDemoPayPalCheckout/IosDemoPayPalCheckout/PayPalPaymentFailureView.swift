import SafariServices
import SwiftUI

struct PayPalPaymentFailureView: View {
    
    @EnvironmentObject var appNavigationViewModel: AppNavigationViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "cart")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("There was an error processing your payment")
                Text("... Display More Details of the error and recovery actions ...")
                Button("🔙 Back to Cart 🛒") {
                    appNavigationViewModel.openCartDetails()
                }.buttonStyle(.bordered)
            }.navigationTitle("😔 Payment Failed").padding()
        }
    }
}
