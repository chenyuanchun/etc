;; highlight-symbol
;(add-to-list 'load-path "~/.emacs.d/highlight-symbol")
(require 'highlight-symbol)

(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
;;(global-set-key [(meta f3)] 'highlight-symbol-prev)))

;; cscope
(add-hook 'c-mode-common-hook
          '(lambda ()
             (set (make-local-variable 'compile-command) "cd /mnts/buildarea13/ase/rayc/temp/algorbuild && make")
             (add-to-list 'load-path "~/.emacs.d/cscope-15.5")
             (require 'xcscope)))
;             (setq cscope-initial-directory "$SOURCE/ase470")))

;; gtag
(add-hook 'c-mode-common-hook
  '(lambda ()
;     (require 'gtags)
;     (gtags-mode 1)
     (require 'xgtags)
     (xgtags-mode 1)))
