# CV2D 首次預覽發行說明草稿

嘗試將符合篩選的舊式 POLYLINE 轉成輕量聚合線，再把全圖 LWPOLYLINE 標高設為 0。

- 指令：CV2D。
- 相依與設定：僅在圖面副本上操作，先確認哪些 LWPOLYLINE 必須保留標高。
- 驗證：完成來源與文件靜態檢查；AutoCAD 實機回歸待完成。
- 已知事項：舊式 POLYLINE 篩選的旗標遮罩是 48，沒有排除 bit 8 的 3D polyline 及 bit 64 的 polyface mesh，可能將其送入 CONVERTPOLY。應修正過濾後驗證混合類型圖面。後續全圖 LWPOLYLINE 僅將 DXF 38 設為 0，不能當成完整 3D 壓平。[POLYLINE DXF 官方說明](https://help.autodesk.com/cloudhelp/2024/ENU/AutoCAD-DXF/files/GUID-ABF6B778-BE20-4B49-9B58-A94E64CEFFF3.htm)。
- 授權：MIT，Copyright (c) 2026 whos-dwg。

本次保留來源位元組；發布時請按實際修補及測試結果更新這份說明。[完整操作](README.md)。
