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
                // Please note that the app-switch-mobile-integration-4e4c9cddcde5.herokuapp.com domain is registered to the entitlements
                // and the web page hosting different payment buttons are rendered on mobile-app-integration-example-034c22d87430.herokuapp.com
                Button("Web SDK Integration") {
                    appNavigationViewModel.openCheckoutLink( "https://mobile-app-integration-example-034c22d87430.herokuapp.com/buttons.html?onApproveUrl=https://app-switch-mobile-integration-4e4c9cddcde5.herokuapp.com/onsuccess&onCancelUrl=https://app-switch-mobile-integration-4e4c9cddcde5.herokuapp.com/redirect-to-app/oncancel")
                }.buttonStyle(.bordered)

                Button("Orders API Only Integration") {
                    appNavigationViewModel.openCheckoutLink( "https://mobile-app-integration-example-034c22d87430.herokuapp.com/api-integration.html?onApproveUrl=https://app-switch-mobile-integration-4e4c9cddcde5.herokuapp.com/onsuccess&onCancelUrl=https://app-switch-mobile-integration-4e4c9cddcde5.herokuapp.com/redirect-to-app/oncancel")

                }.buttonStyle(.bordered)
            }.navigationTitle("🛒 Cart").padding()
        }
    }
}
