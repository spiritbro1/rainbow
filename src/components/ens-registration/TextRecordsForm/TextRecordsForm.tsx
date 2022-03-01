import React, { useState } from 'react';
import InlineField, { InlineFieldProps } from '../../inputs/InlineField';
import Skeleton, { FakeText } from '../../skeleton/Skeleton';
import {
  Box,
  Column,
  Columns,
  Divider,
  Stack,
} from '@rainbow-me/design-system';
import { textRecordFields } from '@rainbow-me/helpers/ens';
import { useENSProfileForm } from '@rainbow-me/hooks';

export default function TextRecordsForm({
  defaultFields,
}: {
  defaultFields: (keyof typeof textRecordFields)[];
}) {
  const {
    isLoading,
    selectedFields,
    onChangeField,
    onBlurField,
    values,
  } = useENSProfileForm({
    defaultFields: defaultFields.map(fieldName => textRecordFields[fieldName]),
  });

  return (
    <Box>
      {isLoading ? (
        <Box background="accent" paddingTop="19px" style={{ height: 300 }}>
          <Skeleton animated>
            <Stack space="30px">
              <FakeField />
              <FakeField />
              <FakeField />
              <FakeField />
              <FakeField />
            </Stack>
          </Skeleton>
        </Box>
      ) : (
        <>
          {selectedFields.map(
            ({ label, inputProps, placeholder, validations, id, key }) => (
              <Box key={id}>
                <Field
                  defaultValue={values[key]}
                  inputProps={inputProps}
                  label={label}
                  onChangeText={text => onChangeField({ key, value: text })}
                  onEndEditing={({ nativeEvent }) => {
                    onBlurField({ key, value: nativeEvent.text });
                  }}
                  placeholder={placeholder}
                  validations={validations}
                />
              </Box>
            )
          )}
        </>
      )}
    </Box>
  );
}

function Field({ defaultValue, ...props }: InlineFieldProps) {
  const [value, setValue] = useState(defaultValue);
  return (
    <>
      <Divider />
      <InlineField
        {...props}
        onChangeText={text => {
          props.onChangeText(text);
          setValue(text);
        }}
        value={value}
      />
    </>
  );
}

function FakeField() {
  return (
    <Columns space="10px">
      <Column width="1/3">
        <FakeText height={16} width="100%" />
      </Column>
      <FakeText height={16} width="100%" />
    </Columns>
  );
}
