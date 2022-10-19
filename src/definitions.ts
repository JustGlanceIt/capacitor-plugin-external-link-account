export interface ExternalLinkAccountPlugin {
  canOpen(): Promise<boolean>;
  open(): Promise<void>;
}
