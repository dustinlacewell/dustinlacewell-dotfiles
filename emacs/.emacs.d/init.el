;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Library Paths
;; Note: keep every emacs library underneath ~/.emacs.d 
;; This makes it easier to use this config on multiple 
;; systems.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d")
;Add all top-level subdirectories of .emacs.d to the load path
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))
;keep third party libraries seperate in ~/.emacs.d/third-party
(add-to-list 'load-path "~/.emacs.d/third-party")
(progn (cd "~/.emacs.d/third-party")
       (normal-top-level-add-subdirs-to-load-path))

(load-library "_autocomplete")
(load-library "_cedet")
(load-library "_ecb")
;(load-library "_tab")
(load-library "_ido")
(load-library "_python")
;(load-library "_yasnippet")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; basic setup                                                                                                                                                                                            
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shorter confirmation prompts
(fset 'yes-or-no-p 'y-or-n-p)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((((class color) (min-colors 8)) (:foreground "cyan"))))
 '(font-lock-function-name-face ((t (:foreground "green"))))
 '(font-lock-keyword-face ((t (:foreground "black" :weight bold))))
 '(font-lock-preprocessor-face ((t (:foreground "black" :weight bold))))
 '(font-lock-string-face ((((class color) (min-colors 8)) (:foreground "magenta"))))
 '(font-lock-type-face ((((class color) (min-colors 8)) (:foreground "yellow"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 8)) (:foreground "yellow" :weight bold))))
 '(mode-line ((t (:foreground "white"))))
 '(mode-line-inactive ((default (:inherit mode-line :foreground "black" :weight bold)) (nil nil)))
 '(nobreak-space ((((class color) (min-colors 8)) nil)))
 '(vertical-border ((((type tty)) (:foreground "black" :weight bold)))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-name "right14")
 '(ecb-options-version "2.40")
 '(ecb-show-sources-in-directories-buffer (quote always))
 '(ecb-windows-width 0.25)
 '(ecb-tip-of-the-day nil)
 '(inhibit-startup-message t)
 '(inhibit-startup-echo-area-message t)
 '(scroll-step 1)
 '(fill-column 81)
 '(make-backup-files nil)
 '(standard-indent 4)
 '(line-number-mode 1)
 '(column-number-mode 1)
)