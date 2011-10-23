;; highlight-symbol
;(add-to-list 'load-path "~/.emacs.d/highlight-symbol")
(require 'highlight-symbol)

(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
;;(global-set-key [(meta f3)] 'highlight-symbol-prev)))

;; cscope
(add-to-list 'load-path "~/.emacs.d/cscope-15.5")
(add-hook 'c-mode-common-hook
          '(lambda ()
            (require 'xcscope)))
(setq cscope-initial-directory "$SOURCE/cscope/4703")

;; gtag
;(require 'gtags)
;(add-hook 'c-mode-common-hook
;  (lambda ()
;    (gtags-mode 1)))
