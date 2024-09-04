import SafariServices
import SwiftUI

struct PayPalPaymentSuccessView: View {
    
    @EnvironmentObject var appNavigationViewModel: AppNavigationViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "cart")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Your payment is successful")
               
                Text(appNavigationViewModel.payPalOrderID!)
                Text("... Display More Details of the order ...")
               
                // Fetch the PayPal Order Details from your REST APIs. The REST APIs should only exposes minimal data as required by your APP.
                // You should also capture or authorize the amounts before fulfilling the buyer order.
                
                Button("🔙 Back to Cart 🛒") {
                    appNavigationViewModel.openCartDetails()
                }.buttonStyle(.bordered)
            }.navigationTitle("🎉 Payment Successful").padding()
        }
    }
}
