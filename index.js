import React from "react";
import { NativeEventEmitter, NativeModules } from "react-native";

const { RNFullscreenListener } = NativeModules;

const fullscreenEmitter = new NativeEventEmitter(RNFullscreenListener);

export default React.memo(({ onChange }) => {
  React.useEffect(() => {
    let subscription;
    if (onChange) {
      subscription = fullscreenEmitter.addListener(
        "fullscreenChanged",
        ({ fullscreen }) => {
          onChange(fullscreen);
        }
      );
      return () => {
        subscription.remove();
      };
    }
  }, [onChange]);
  return null;
});
