import Foundation
import StoreKit

@objc public class ExternalLinkAccount: NSObject {
    @objc public func canOpen() async -> Bool {
        if #available(iOS 16.0, *) {
            return await StoreKit.ExternalLinkAccount.canOpen
        } else {
            return StoreKit.SKPaymentQueue.canMakePayments()
        }
    }

    @objc public func open() async throws {
        if #available(iOS 16.0, *) {
            do {
                return try await StoreKit.ExternalLinkAccount.open()
            } catch {
                throw ExternalLinkAccountError.cannotOpen;
            }
        } else {
            throw ExternalLinkAccountError.implementManually
        }
    }
}
