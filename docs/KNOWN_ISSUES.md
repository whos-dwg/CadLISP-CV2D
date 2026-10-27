# 已知問題

## 需先修正

舊式 POLYLINE 篩選的旗標遮罩是 48，沒有排除 bit 8 的 3D polyline 及 bit 64 的 polyface mesh，可能將其送入 CONVERTPOLY。應修正過濾後驗證混合類型圖面。後續全圖 LWPOLYLINE 僅將 DXF 38 設為 0，不能當成完整 3D 壓平。[POLYLINE DXF 官方說明](https://help.autodesk.com/cloudhelp/2024/ENU/AutoCAD-DXF/files/GUID-ABF6B778-BE20-4B49-9B58-A94E64CEFFF3.htm)。

## 使用限制

原碼以旗標遮罩 48 篩選舊式 POLYLINE，未排除 DXF bit 8 的 3D polyline 及 bit 64 的 polyface mesh，不能視為可靠的純 2D 過濾。它只把 LWPOLYLINE 的 DXF 38 改為 0，不能宣稱把所有 3D 幾何完整壓平。

僅在圖面副本上操作，先確認哪些 LWPOLYLINE 必須保留標高。

本次保留原始碼位元組，未修補功能；上述來源觀察不等於 AutoCAD 實機驗證結果。[返回 README](../README.md)。
