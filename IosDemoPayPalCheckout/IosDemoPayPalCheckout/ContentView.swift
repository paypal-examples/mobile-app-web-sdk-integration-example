import SwiftUI
import SafariServices

struct ContentView: View {
    
    @EnvironmentObject var appNavigationViewModel: AppNavigationViewModel
    
    var body: some View {
        switch appNavigationViewModel.currentTab {
        case .payPalPaymentSuccess:
            PayPalPaymentSuccessView()
        case .payPalPaymentFailure:
            PayPalPaymentFailureView()
        default:
            CartDetailsView()
        }
    }
}

#Preview {
    ContentView()
}
