;; auto-complete customizations
(add-to-list 'load-path "~/.emacs.d/third-party/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/third-party/auto-complete/ac-dict")
(ac-config-default)

(setq ac-quick-help-delay 0.1)
(setq ac-delay 0)
(setq ac-auto-show-menu 0)
(setq ac-expand-on-auto-complete nil)
(setq ac-comphist-threshold 0.4)

(define-key ac-completing-map "\t" 'ac-complete)