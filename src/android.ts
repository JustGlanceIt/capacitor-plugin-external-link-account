import { WebPlugin } from '@capacitor/core';

import type { ExternalLinkAccountPlugin } from './definitions';

export class ExternalLinkAccountAndroid
  extends WebPlugin
  implements ExternalLinkAccountPlugin
{
  canOpen(): Promise<boolean> {
    throw new Error('Method not implemented.');
  }
  open(): Promise<void> {
    throw new Error('Method not implemented.');
  }
}
