import { registerPlugin } from '@capacitor/core';

import type { ExternalLinkAccountPlugin } from './definitions';

const ExternalLinkAccount = registerPlugin<ExternalLinkAccountPlugin>(
  'ExternalLinkAccount',
  {
    web: () => import('./web').then(m => new m.ExternalLinkAccountWeb()),
    android: () =>
      import('./android').then(m => new m.ExternalLinkAccountAndroid()),
  },
);

export * from './definitions';
export { ExternalLinkAccount };
