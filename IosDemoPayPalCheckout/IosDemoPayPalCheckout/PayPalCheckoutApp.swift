import SwiftUI

@main
struct PayPalCheckoutApp: App {

    @StateObject var appNavigationViewModel: AppNavigationViewModel = AppNavigationViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appNavigationViewModel)
                .onOpenURL { url in
                    if appNavigationViewModel.checkDeepLink(with: url) {
                        print("App Launched via Deep Link")
                    }
                }
        }
    }
}
