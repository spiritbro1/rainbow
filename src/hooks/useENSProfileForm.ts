import { isEmpty, omit } from 'lodash';
import { useCallback, useEffect, useMemo } from 'react';
import { useDispatch } from 'react-redux';
import { atom, useRecoilState } from 'recoil';
import { useENSProfile } from '.';
import { Records } from '@rainbow-me/entities';
import { textRecordFields } from '@rainbow-me/helpers/ens';

const disabledAtom = atom({
  default: false,
  key: 'ensProfileForm.disabled',
});

const selectedFieldsAtom = atom({
  default: [],
  key: 'ensProfileForm.selectedFields',
});

const valuesAtom = atom<{ [name: string]: Partial<Records> }>({
  default: {},
  key: 'ensProfileForm.values',
});

export default function useENSProfileForm({
  defaultFields,
}: {
  defaultFields?: any[];
} = {}) {
  const {
    name,
    records,
    recordsQuery,
    removeRecordByKey,
    updateRecordByKey,
    updateRecords,
  } = useENSProfile();

  const dispatch = useDispatch();

  const [disabled, setDisabled] = useRecoilState(disabledAtom);

  const [selectedFields, setSelectedFields] = useRecoilState(
    selectedFieldsAtom
  );
  useEffect(() => {
    // If there are existing records in the global state, then we
    // populate with that.
    if (!isEmpty(records)) {
      setSelectedFields(
        // @ts-ignore
        Object.keys(records)
          // @ts-ignore
          .map(key => textRecordFields[key])
          .filter(x => x)
      );
    } else {
      if (defaultFields) {
        setSelectedFields(defaultFields as any);
      }
    }
  }, [name, records]); // eslint-disable-line react-hooks/exhaustive-deps

  const [valuesMap, setValuesMap] = useRecoilState(valuesAtom);
  const values = valuesMap[name] || {};
  useEffect(() => setValuesMap(values => ({ ...values, [name]: records })), [
    name,
    records,
    setValuesMap,
  ]);

  // Set initial records in redux depending on user input (defaultFields)
  useEffect(() => {
    if (isEmpty(records) && defaultFields) {
      const records = defaultFields.reduce((records, field) => {
        return {
          ...records,
          [field.key]: '',
        };
      }, {});
      updateRecords(records);
    }
  }, [defaultFields, dispatch, records, selectedFields, updateRecords]);

  const onAddField = useCallback(
    (fieldToAdd, selectedFields) => {
      setSelectedFields(selectedFields);
      updateRecordByKey(fieldToAdd.key, '');
    },
    [setSelectedFields, updateRecordByKey]
  );

  const onRemoveField = useCallback(
    (fieldToRemove, selectedFields) => {
      setSelectedFields(selectedFields);
      removeRecordByKey(fieldToRemove.key);
      setValuesMap(values => ({
        ...values,
        [name]: omit(values?.[name] || {}, fieldToRemove.key) as Records,
      }));
    },
    [name, removeRecordByKey, setSelectedFields, setValuesMap]
  );

  const onBlurField = useCallback(
    ({ key, value }) => {
      setValuesMap(values => ({
        ...values,
        [name]: { ...values?.[name], [key]: value },
      }));
      updateRecordByKey(key, value);
    },
    [name, setValuesMap, updateRecordByKey]
  );

  const onChangeField = useCallback(
    ({ key, value }) => {
      setValuesMap(values => ({
        ...values,
        [name]: { ...values?.[name], [key]: value },
      }));
    },
    [name, setValuesMap]
  );

  const empty = useMemo(() => !Object.values(values).some(Boolean), [values]);

  return {
    disabled,
    isEmpty: empty,
    isLoading: recordsQuery.isLoading,
    onAddField,
    onBlurField,
    onChangeField,
    onRemoveField,
    selectedFields,
    setDisabled,
    values,
  };
}
