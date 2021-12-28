import {
  get,
  groupBy,
  isEmpty,
  isNil,
  mapValues,
  toNumber,
  values,
} from 'lodash';
import { createSelector } from 'reselect';
import { sortList } from '../helpers/sortList';
import { parseAssetsNative } from '@rainbow-me/parsers';

const EMPTY_ARRAY = [];

const assetPricesFromUniswapSelector = state =>
  state.data.assetPricesFromUniswap;
const accountAssetsDataSelector = state => state.data.accountAssetsData;
const nativeCurrencySelector = state => state.settings.nativeCurrency;

const sortAssetsByNativeAmount = (
  accountAssetsData,
  assetPricesFromUniswap,
  nativeCurrency
) => {
  let updatedAssets = accountAssetsData;
  if (!isEmpty(assetPricesFromUniswap)) {
    updatedAssets = mapValues(accountAssetsData, asset => {
      if (isNil(asset.price)) {
        const assetPrice = get(
          assetPricesFromUniswap,
          `[${asset.address}].price`
        );
        const relativePriceChange = get(
          assetPricesFromUniswap,
          `[${asset.address}].relativePriceChange`
        );
        if (assetPrice) {
          return {
            ...asset,
            price: {
              relative_change_24h: relativePriceChange,
              value: assetPrice,
            },
          };
        }
      }
      return asset;
    });
  }
  let assetsNativePrices = values(updatedAssets);
  if (!isEmpty(assetsNativePrices)) {
    assetsNativePrices = parseAssetsNative(assetsNativePrices, nativeCurrency);
  }
  const {
    hasValue = EMPTY_ARRAY,
    noValue = EMPTY_ARRAY,
  } = groupAssetsByMarketValue(assetsNativePrices);

  const sortedAssetsNoShitcoins = sortList(
    hasValue,
    'native.balance.amount',
    'desc',
    0,
    toNumber
  );
  const sortedShitcoins = sortList(noValue, 'name', 'asc');
  const sortedAssets = sortedAssetsNoShitcoins.concat(sortedShitcoins);

  return sortedAssets;
};

const groupAssetsByMarketValue = assets =>
  groupBy(assets, ({ native }) => (isNil(native) ? 'noValue' : 'hasValue'));

export const sortAssetsByNativeAmountSelector = createSelector(
  [
    accountAssetsDataSelector,
    assetPricesFromUniswapSelector,
    nativeCurrencySelector,
  ],
  sortAssetsByNativeAmount
);
