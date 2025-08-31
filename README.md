# Android Auto Role Fix for MIUI / HyperOS

A companion module for [aa4mg](https://github.com/sn-00-x/aa4mg). Fixes Android Auto role definitions on Xiaomi's CN ROMs (MIUI / HyperOS).

## Disclaimer

Tested only on **Mi 10 with MIUI 14**. Use on other devices or ROM versions at your own risk. Modifications to your system may be required.

### The Problem

On Xiaomi's stock CN ROMs, Android Auto crashes on launch with a `java.lang.SecurityException`. Logcat analysis reveals this is because the app fails to acquire the `android.permission.REQUEST_COMPANION_PROFILE_AUTOMOTIVE_PROJECTION` permission.

This critical permission is managed by the Android system's Role Manager. To obtain it, an app must be granted the `SYSTEM_AUTOMOTIVE_PROJECTION` role.

The root cause is that the role definition file on CN ROMs, `GmsCnConfigOverlay.apk`, is stripped down and does **not** define this necessary role.

### The Fix

This module replaces the incomplete `GmsCnConfigOverlay.apk` with the full version (`GmsConfigOverlayCommon.apk`) from the Global ROM. This restored APK correctly defines the `SYSTEM_AUTOMOTIVE_PROJECTION` role, allowing the system to grant it—and its associated permissions, including `REQUEST_COMPANION_PROFILE_AUTOMOTIVE_PROJECTION`—to Android Auto.

### Usage

If you have already correctly installed `aa4mg` but the phone shows no reaction without any error, then try installing this module alongside the `aa4mg` module to resolve the issue.
### Credits

- Core solution discovered and detailed from [here](https://zhuanlan.zhihu.com/p/743030058).
