import SafariServices
import SwiftUI

struct CartDetailsView: View {

    @EnvironmentObject var appNavigationViewModel: AppNavigationViewModel

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "cart")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("...Cart Details...")
                Text("Checkout with PayPal").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Button("Web SDK integration") {
                    appNavigationViewModel.openCheckoutLink("https://shipping-change-sandbox-e66e294a9266.herokuapp.com/buttons.html?onApproveUrl=paypalmerchantintegrationexample://payPalPaymentSuccess&onCancelUrl=paypalmerchantintegrationexample://payPalBuyerCancelled")
                }.buttonStyle(.bordered)
                Button("Orders API only integration") {
                    appNavigationViewModel.openCheckoutLink("https://shipping-change-sandbox-e66e294a9266.herokuapp.com/api-integration.html?onApproveUrl=paypalmerchantintegrationexample://payPalPaymentSuccess&onCancelUrl=paypalmerchantintegrationexample://payPalBuyerCancelled")
                }.buttonStyle(.bordered)
            }.navigationTitle("🛒 Cart").padding()
        }
    }
}
