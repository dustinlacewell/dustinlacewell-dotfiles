(autoload 'magit-status "magit" nil t)
(require 'tramp)
(setq tramp-default-method "scp")

(global-set-key (kbd "M-g s") 'magit-status)