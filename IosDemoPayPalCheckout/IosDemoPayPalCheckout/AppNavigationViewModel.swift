import SwiftUI
import SafariServices

enum CheckoutDeepLinks: String {
    case cartDetails
    case payPalBuyerCanceled
    case payPalPaymentSuccess
    case payPalPaymentFailure
}

class AppNavigationViewModel: ObservableObject {

    @Published var currentTab: CheckoutDeepLinks = .cartDetails
    @Published var safariViewController: SFSafariViewController?
    @Published var isSafariViewControllerOpen: Bool = false
    @Published var payPalOrderID: String?

    func getQueryStringParameter(from url: URL, for param: String) -> String? {
        guard let url = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }

    func checkDeepLink(with url: URL) -> Bool {
        dismissSafariViewController()
        print("Got URL: \(url)")

        guard let host = URLComponents(url: url, resolvingAgainstBaseURL: true)?.host else {
            return false
        }

        guard let orderID = getQueryStringParameter(from: url, for: "payPalOrderID") else {
            currentTab = .payPalPaymentFailure
            return false
        }

        payPalOrderID = orderID
        print("Got Host: \(host) Order ID: \(orderID)")

        switch host {
        case CheckoutDeepLinks.payPalBuyerCanceled.rawValue:
            currentTab = .payPalPaymentFailure
        case CheckoutDeepLinks.payPalPaymentSuccess.rawValue:
            currentTab = .payPalPaymentSuccess
        default:
            currentTab = .cartDetails
        }

        return true
    }

    func openCheckoutLink(_ urlString: String) {
        safariViewController = SFSafariViewController(url: URL(string: urlString)!)
        guard let safariViewController else { return }
        UIApplication.shared.firstKeyWindow?.rootViewController?.present(safariViewController, animated: true)
        isSafariViewControllerOpen = true
    }

    func openCartDetails() {
        currentTab = .cartDetails
    }

    func dismissSafariViewController() {
        guard let safariViewController else { return }
        if isSafariViewControllerOpen {
            isSafariViewControllerOpen = false
            safariViewController.dismiss(animated: true)
        }
    }
}

extension UIApplication {

    var firstKeyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .filter { $0.activationState == .foregroundActive }
            .first?.keyWindow
    }
}
