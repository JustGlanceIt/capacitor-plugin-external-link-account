import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(ExternalLinkAccountPlugin)
public class ExternalLinkAccountPlugin: CAPPlugin {
    private let implementation = ExternalLinkAccount()

    @objc func canOpen(_ call: CAPPluginCall) async {
        call.resolve([
            "value": await implementation.canOpen()
        ])
    }

    @objc func open(_ call: CAPPluginCall) async {
        do {
            try await implementation.open()
            call.resolve()
        } catch ExternalLinkAccountError.implementManually {
            call.reject("ExternalLinkAccount modal must be implemented manually", nil, ExternalLinkAccountError.implementManually)
        } catch ExternalLinkAccountError.cannotOpen {
            call.reject("ExternalLinkAccount modal cannot be open", nil, ExternalLinkAccountError.cannotOpen)
        } catch {
            call.reject("ExternalLinkAccount modal cannot be open", nil, error)
        }
    }
}
