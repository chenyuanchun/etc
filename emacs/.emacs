
(add-to-list 'load-path "~/.emacs.d/site-lisp")

(mapc 'load (directory-files "~/.emacs.d/local" t "^[a-zA-Z0-9].*.el$"))

;; start in server mode
(require 'server)
(when (and (= emacs-major-version 23)
					 (= emacs-minor-version 3)
           (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                                 ; ~/.emacs.d/server is unsafe"
                                                 ; on windows.
(server-start)