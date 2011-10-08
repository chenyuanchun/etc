
;; Behavior
(setq inhibit-startup-message   t)  ; Don't want any startup message
(setq backup-inhibited t)			; disable backup
(setq auto-save-default nil)
(setq case-fold-search t)			; case sensitive search
(delete-selection-mode 1)			; delete/replace selected text
(setq default-tab-width 2)
(setq-default indent-tabs-mode nil); indent with spaces
(setq backup-by-copying-when-mismatch t)


;; Treat 'y' or <CR> as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)
(define-key query-replace-map [return] 'act)
;(define-key query-replace-map [?\C-m] 'act)
