import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(ExternalLinkAccountPlugin)
public class ExternalLinkAccountPlugin: CAPPlugin {
    private let implementation = ExternalLinkAccount()

    @objc public func canOpen(_ call: CAPPluginCall) {
        Task {
            call.resolve([
                "value": await implementation.canOpen()
            ])
        }
    }

    @objc public func open(_ call: CAPPluginCall) {
        Task {
            do {
                try await implementation.open()
                call.resolve()
            } catch ExternalLinkAccountError.implementManually {
                call.unavailable("ExternalLinkAccount modal must be implemented manually")
            } catch ExternalLinkAccountError.cannotOpen {
                call.reject("ExternalLinkAccount modal cannot be open", nil, ExternalLinkAccountError.cannotOpen)
            } catch {
                call.reject("ExternalLinkAccount modal cannot be open", nil, error)
            }
        }
    }
}
