export interface ExternalLinkAccountPlugin {
  /**
   * Resolves with `value` === `true` if app can open interstitial modal sheet before linking out, `false` otherwise.
   */
  canOpen(): Promise<{ value: boolean }>;

  /**
   * Opens interstitial modal sheet before linking out if available,
   * throws exception if cannot link outside or modal is not available.
   *
   * Modal is available for `iOS 16.0` or greater.
   */
  open(): Promise<void>;
}
