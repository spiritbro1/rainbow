import React from 'react';
import RadialGradient from 'react-native-radial-gradient';
import { useTheme } from '../context/ThemeContext';
import { TruncatedText } from './text';
import { padding } from '@rainbow-me/styles';
import styled from 'rainbowed-components';

const Gradient = styled(RadialGradient).attrs(
  ({ theme: { colors }, borderRadius = 10.5 }) => ({
    center: [0, borderRadius],
    colors: colors.gradients.lightGrey,
  })
)(({ borderRadius, paddingHorizontal, paddingVertical }) => ({
  ...padding.object(paddingVertical || 2, paddingHorizontal || 6),
  borderRadius: borderRadius || 10.5,
  overflow: 'hidden',
}));

export default function Pill({ children, ...props }) {
  const { colors } = useTheme();

  return (
    <Gradient {...props}>
      <TruncatedText
        align="center"
        color={colors.alpha(colors.blueGreyDark, 0.5)}
        letterSpacing="uppercase"
        size="smedium"
        weight="semibold"
        {...props}
      >
        {children}
      </TruncatedText>
    </Gradient>
  );
}
