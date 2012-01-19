(when (not (eq system-type 'usg-unix-v))

(setq load-path (cons "~/.emacs.d/org-7.8.03/lisp" load-path))
(setq load-path (cons "~/.emacs.d/org-7.8.03/contrib/lisp" load-path))
 
(require 'org-install)
(require 'org-publish)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 
(lambda () (setq truncate-lines nil)))
 
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

)