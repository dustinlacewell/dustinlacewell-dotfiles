;; python-mode customizations

;; pymacs integration
(require 'pymacs)
;; ropemacs integration
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-guess-project       t)
(setq ropemacs-separate-doc-buffer t)
(setq ropemacs-enable-autoimport   nil)

