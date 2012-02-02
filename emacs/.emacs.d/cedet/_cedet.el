;; load every emacs library underneath ~/.emacs.d/third-party
(add-to-list 'load-path "~/.emacs.d/third-party/cedet-1.0/")
(add-to-list 'load-path "~/.emacs.d/third-party/cedet-1.0/eieio/")
(add-to-list 'load-path "~/.emacs.d/third-party/cedet-1.0/cogre/")
(add-to-list 'load-path "~/.emacs.d/third-party/cedet-1.0/contrib/")
(add-to-list 'load-path "~/.emacs.d/third-party/cedet-1.0/common/")
(add-to-list 'load-path "~/.emacs.d/third-party/cedet-1.0/ede/")
(add-to-list 'load-path "~/.emacs.d/third-party/cedet-1.0/semantic/")
(add-to-list 'load-path "~/.emacs.d/third-party/cedet-1.0/speedbar/")
(add-to-list 'load-path "~/.emacs.d/third-party/cedet-1.0/srecode/")

(load-file "~/.emacs.d/third-party/cedet-1.0/common/cedet.el")
(global-ede-mode t)
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu
(global-srecode-minor-mode 1)
;; add TAGS menu
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)



;; speedbar
(require 'sr-speedbar)
(global-set-key (kbd "M-s") 'sr-speedbar-toggle)
(setq speedbar-show-unknown-files t)
(speedbar-add-supported-extension ".php")