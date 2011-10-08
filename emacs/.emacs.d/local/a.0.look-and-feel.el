;; Look and feel
(tool-bar-mode -1)					; hide tool bar
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme-subdued)
(color-theme-initialize)
(color-theme-subdued)

; set initial frame size/position
;(setq initial-frame-alist '((top . 40) (left . 10) (width . 90) (height . 50)))
; frame title to display full path
(setq frame-title-format (list (format "%s %%S: %%j " (system-name)) '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

