/**
 * This file contains flags for enabling features which are still in development.
 * While adding new functionality, please verify it against these features
 * keeping in mind that they should never be broken
 */

export const LANGUAGE_SETTINGS = 'languageSettings';
export const REVIEW_ANDROID = 'reviewAndroid';
export const PROFILES = 'profiles';

export const defaultConfig = {
  [LANGUAGE_SETTINGS]: false,
  [PROFILES]: false,
  [REVIEW_ANDROID]: false,
};
