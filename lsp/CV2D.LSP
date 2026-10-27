(defun c:CV2D (/ ss i ent data)
  (setvar "cmdecho" 0)
  
  ;; 1. 選取圖面中所有的「舊式 2D 聚合線」
  ;; 篩選條件：物件類型為 POLYLINE，且排除 3D 聚合線 (bit 16) 與 3D 網格 (bit 32)
  (setq ss (ssget "X" '((0 . "POLYLINE") (-4 . "<NOT") (-4 . "&") (70 . 48) (-4 . "NOT>"))))
  
  (if ss
    (progn
      ;; 使用內建指令將選取的舊式聚合線轉換為輕量聚合線 (Lightweight)
      (command "_.convertpoly" "_l" ss "")
      (princ (strcat "\n已轉換 " (itoa (sslength ss)) " 個聚合線。"))
    )
    (princ "\n未發現需要轉換的舊式 2D 聚合線。")
  )

  ;; 2. 處理所有「輕量聚合線」，將 Z 軸（標高）資訊歸零
  ;; 這裡會選取圖中所有的 LWPOLYLINE
  (if (setq ss (ssget "X" '((0 . "LWPOLYLINE"))))
    (progn
      (setq i 0)
      (repeat (sslength ss)
        (setq ent (ssname ss i))
        (setq data (entget ent))
        ;; 群組碼 38 代表標高 (Elevation)，將其改為 0.0
        (if (assoc 38 data)
          (setq data (subst (cons 38 0.0) (assoc 38 data) data))
          (setq data (append data (list (cons 38 0.0))))
        )
        (entmod data)
        (setq i (1+ i))
      )
      (princ "\n所有聚合線的 Z 軸資訊已移除（標高歸零）。")
    )
  )

  (setvar "cmdecho" 1)
  (princ "\n執行完成。")
  (princ)
)