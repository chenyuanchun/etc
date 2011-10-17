(add-to-list 'load-path "~/.emacs.d/autocomplete")    ; This may not be appeared if you have already added.
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/autocomplete/ac-dict")
(add-to-list 'ac-user-dictionary-files "~/.emacs.d/autocomplete/mydict")
(ac-config-default)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)