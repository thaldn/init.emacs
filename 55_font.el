;; -*- encoding: utf-8-unix; -*-
;; * default
(set-default-font "Monospace-12")

;; Setting English Font
;; (set-face-attribute 'default nil :font "Consolas 12")

;; * gui
(when window-system
  ;; ** all
  (if (eq window-system 'w32)
      ;; myfont1 是 buffer-face-mode 及 mode-line 字体
      (setq myfont "Yahei Mono" myfont1 "宋体")
    (setq myfont "文泉驿等宽正黑" myfont1 "文泉驿点阵正黑"))

  (setq
   ;; 设置行距
   default-line-spacing   0
   ;; 设置窗口大小 位置
   initial-frame-alist    '((width . 100)(height . 32)(top . 1)(left . 90))
   )

  (set-fontset-font (frame-parameter nil 'font)
                    'unicode `(,myfont . "unicode-bmp"))

  ;; ** buffer face mode
  (set-face-attribute 'variable-pitch nil
                      :font (concat myfont1 "-10") :fontset "fontset-standard")

  (defun my-buffer-face-mode()
    (buffer-face-mode)
    (make-local-variable 'line-spacing)
    (setq line-spacing 4)
    )
  (defun custom-buffer-face-mode()
    (interactive)
    (if (and (boundp 'buffer-face-mode) buffer-face-mode)
        nil
      (my-buffer-face-mode)))

  (dolist (hook '(
                  completion-list-mode-hook
                  eshell-mode-hook
                  help-mode-hook
                  magit-mode-hook
                  debugger-mode-hook
                  compilation-mode-hook
                  dired-mode-hook
                  vc-mode-line-hook
                  diff-mode-hook
                  ;; ido-make-buffer-list-hook
                  ;; ido-make-file-list-hook
                  ;; ido-make-dir-list-hook
                  ;; undo-tree-visualizer-mode-hook
                  ))
    (add-hook hook 'my-buffer-face-mode))
  ;; ** mode-line
  (custom-set-faces
   `(mode-line ((t (:height 0.8 :family ,myfont1))))
   `(header-line ((t (:height 0.8 :family ,myfont1)))))
  )
