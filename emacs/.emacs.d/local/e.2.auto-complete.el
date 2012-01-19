(when (not (eq system-type 'usg-unix-v))

(add-to-list 'load-path "~/.emacs.d/autocomplete")

;(require 'auto-complete)
(require 'auto-complete-config)
;(require 'gtags)
(require 'auto-complete-gtags)

;(add-to-list 'ac-dictionary-directories "~/.emacs.d/autocomplete/ac-dict")
;(add-to-list 'ac-user-dictionary-files "~/.emacs.d/autocomplete/mydict")

(ac-config-default)

(set-default 'ac-sources
             '(ac-source-yasnippet
             ac-source-words-in-buffer
						 ac-source-words-in-same-mode-buffers))

;(define-key ac-mode-map (kbd "M-;") 'auto-complete)

)
