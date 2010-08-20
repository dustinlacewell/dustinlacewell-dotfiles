
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

(setq gnus-permanently-visible-groups "mail")

(autoload 'magit-status "magit" nil t)
(require 'tramp)
(setq tramp-default-method "scp")

;; Codepad
(autoload 'codepad-paste-region "codepad" "Paste region to codepad.org." t)
(autoload 'codepad-paste-buffer "codepad" "Paste buffer to codepad.org." t)
(autoload 'codepad-fetch-code "codepad" "Fetch code from codepad.org." t)


(load-library "_autocomplete")
(load-library "_cedet")
;(load-library "_ecb")
;(load-library "_tab")
(load-library "_ido")
(load-library "_mail")
(load-library "_python")
;(load-library "_yasnippet")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; basic setup
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Buffer browsing
(global-set-key (kbd "C-x C-j") 'previous-buffer)
(global-set-key (kbd "C-x C-k") 'next-buffer)

;; Shorter confirmation prompts
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "C-M-m") 'xterm-mouse-mode)

;; Close all buffers
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key "\C-cx" 'close-all-buffers)


;; Enable system CLIPBOARD
;;(setq x-select-enable-clipboard t)
;;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-default-highlight-face ((((class color) (background light)) (:foreground "magenta"))))
 '(ecb-source-in-directories-buffer-face ((((class color) (min-colors 8)) (:foreground "cyan"))))
 '(ecb-source-read-only-face ((((class color) (background light)) (:inherit ecb-default-general-face :background "red" :slant italic))))
 '(font-lock-builtin-face ((((class color) (min-colors 8)) nil)))
 '(font-lock-comment-face ((((class color) (min-colors 8)) (:foreground "green" :weight bold))))
 '(font-lock-constant-face ((((class color) (min-colors 8)) nil)))
 '(font-lock-function-name-face ((t (:foreground "yellow"))))
 '(font-lock-keyword-face ((t (:foreground "black" :weight bold))))
 '(font-lock-preprocessor-face ((t (:foreground "black" :weight bold))))
 '(font-lock-string-face ((((class color) (min-colors 8)) (:foreground "green"))))
 '(font-lock-type-face ((((class color) (min-colors 8)) (:foreground "yellow"))))
 '(mode-line ((t (:foreground "white"))))
 '(mode-line-inactive ((default (:inherit mode-line :foreground "black" :weight bold)) (nil nil)))
 '(nobreak-space ((((class color) (min-colors 8)) nil)))
 '(speedbar-button-face ((((class color) (background light)) (:foreground "white"))))
 '(speedbar-directory-face ((((class color) (background light)) (:foreground "white"))))
 '(speedbar-file-face ((((class color) (background light)) (:foreground "cyan" :weight bold))))
 '(speedbar-selected-face ((((class color) (background light)) (:foreground "red"))))
 '(speedbar-tag-face ((((class color) (background light)) (:foreground "green"))))
 '(vertical-border ((((type tty)) (:foreground "black" :weight bold))))
 '(wl-highlight-summary-new-face ((((type tty) (background dark)) (:foreground "green"))))
 '(wl-highlight-summary-prefetch-face ((((type tty) (background dark)) (:foreground "red"))))
 '(wl-highlight-summary-thread-top-face ((((type tty) (background dark)) (:foreground "white"))))
 '(wl-highlight-summary-unread-face ((((type tty) (background dark)) (:foreground "black")))))
  
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode 1)
 '(ecb-layout-name "right14")
 '(ecb-options-version "2.40")
 '(ecb-show-sources-in-directories-buffer (quote always))
 '(ecb-tip-of-the-day nil)
 '(ecb-use-speedbar-instead-native-tree-buffer (quote dir))
 '(ecb-windows-width 0.25)
 '(fill-column 81)
 '(inhibit-startup-echo-area-message t)
 '(inhibit-startup-screen t)
 '(line-number-mode 1)
 '(make-backup-files nil)
 '(scroll-step 1)
 '(speedbar-supported-extension-expressions (quote (".wy" ".by" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".css" ".js")))
 '(standard-indent 4)
 '(tramp-default-user "ldlework")
 '(wl-insert-message-id nil))

