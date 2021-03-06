;; library paths
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "/usr/share/emacs23/site-lisp/")
(add-to-list 'load-path "/usr/share/emacs23/site-lisp/yaml-mode/")
;; load every emacs library underneath ~/.emacs.d 
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))
;; load every emacs library underneath ~/.emacs.d/third-party
(add-to-list 'load-path "~/.emacs.d/third-party")
(progn (cd "~/.emacs.d/third-party")
       (normal-top-level-add-subdirs-to-load-path))

;; custom faces
;; * do not edit below this line -----------------------------------------------
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#202324" :foreground "#c0c0c0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(ac-completion-face ((t (:foreground "lightblue" :underline t))))
 '(bold ((t (:foreground "orange" :weight bold))))
 '(button ((((supports :underline t)) (:background "#363636" :underline t))))
 '(column-marker-1 ((t (:background "black" :foreground "black"))))
 '(cursor ((t (:background "#06989A"))))
 '(custom-button ((((type x w32 ns) (class color)) (:background "#555753" :box (:line-width 2 :style released-button)))))
 '(custom-link ((t (:foreground "#729FCF" :underline t))))
 '(ecb-default-highlight-face ((((class color) (background light)) (:foreground "magenta"))))
 '(ecb-source-in-directories-buffer-face ((((class color) (min-colors 8)) (:foreground "cyan"))))
 '(ecb-source-read-only-face ((((class color) (background light)) (:inherit ecb-default-general-face :background "red" :slant italic))))
 '(font-lock-builtin-face ((t (:foreground "#FCE94F" :weight bold))))
 '(font-lock-comment-face ((((class color) (min-colors 8)) (:foreground "#82B650" :weight bold))))
 '(font-lock-constant-face ((((class color) (min-colors 8)) (:foreground "darkgrey"))))
 '(font-lock-function-name-face ((t (:foreground "yellow"))))
 '(font-lock-keyword-face ((t (:foreground "#555753" :weight bold))))
 '(font-lock-preprocessor-face ((t (:foreground "black" :weight bold))))
 '(font-lock-string-face ((((class color) (min-colors 8)) (:foreground "#4E9A06"))))
 '(font-lock-type-face ((((class color) (min-colors 8)) (:foreground "#C4A000"))))
 '(font-lock-warning-face ((((class color) (min-colors 8)) (:foreground "white"))))
 '(ido-subdir-face ((((class color)) (:foreground "#B57E30" :weight ultra-bold))))
 '(isearch ((((class color) (min-colors 88) (background dark)) (:background "#BAAE5B" :foreground "brown4"))))
 '(link ((((class color) (min-colors 88) (background dark)) (:foreground "#729FCF" :underline t))))
 '(menu ((t nil)))
 '(minibuffer-prompt ((((background dark)) (:foreground "#B57E30"))))
 '(mode-line ((t (:background "#384F6C" :foreground "white" :box (:line-width -1 :style released-button)))))
 '(mode-line-buffer-id ((t (:background "#384F6C" :foreground "white" :weight bold))))
 '(mode-line-inactive ((default (:inherit mode-line :foreground "black" :weight bold)) (nil nil)))
 '(nobreak-space ((((class color) (min-colors 8)) nil)))
 '(org-date ((((class color) (background dark)) (:inherit link))))
 '(org-document-title ((((class color) (background dark)) (:foreground "white" :weight bold :height 1.44 :family "MonteCarlo-10"))))
 '(org-link ((t (:inherit link :underline t))))
 '(region ((t (:background "#384F6C" :foreground "white"))))
 '(speedbar-button-face ((((class color) (background light)) (:foreground "white"))))
 '(speedbar-directory-face ((((class color) (background light)) (:foreground "white"))))
 '(speedbar-file-face ((((class color) (background light)) (:foreground "cyan" :weight bold))))
 '(speedbar-selected-face ((((class color) (background light)) (:foreground "red"))))
 '(speedbar-tag-face ((((class color) (background light)) (:foreground "green"))))
 '(tool-bar ((default (:background "#252728" :box (:line-width 10 :style released-button))) (((type x w32 ns) (class color)) (:background "grey75"))))
 '(vertical-border ((((type tty)) (:foreground "black" :weight bold))))
 '(wl-highlight-summary-new-face ((((type tty) (background dark)) (:foreground "green"))))
 '(wl-highlight-summary-prefetch-face ((((type tty) (background dark)) (:foreground "red"))))
 '(wl-highlight-summary-thread-top-face ((((type tty) (background dark)) (:foreground "white"))))
 '(wl-highlight-summary-unread-face ((((type tty) (background dark)) (:foreground "black")))))
  
;; custom variables
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
 '(grep-command "ack-grep")
 '(grep-find-command "ack-grep")
 '(indent-tabs-mode nil)
 '(inhibit-startup-echo-area-message t)
 '(inhibit-startup-screen t)
 '(line-move-visual t)
 '(line-number-mode 1)
 '(make-backup-files nil)
 '(minimap-always-recenter nil)
 '(minimap-dedicated-window t)
 '(minimap-hide-fringes t)
 '(minimap-hide-scroll-bar t)
 '(minimap-update-delay 0.0)
 '(org-return-follows-link t)
 '(scroll-step 1)
 '(speedbar-show-unknown-files t)
 '(speedbar-supported-extension-expressions (quote (".php" ".wy" ".by" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".css" ".js")))
 '(speedbar-tag-hierarchy-method (quote (speedbar-trim-words-tag-hierarchy)))
 '(standard-indent 4)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60)))
 '(tab-width 4)
 '(tramp-default-user "root")
 '(wl-insert-message-id nil)
 '(xterm-mouse-mode t))


(when (display-graphic-p)
  ;; favorite font
  (set-face-attribute 'default nil :font "tamsyn-15"))

;; clipboard integration
(load-file "~/.emacs.d/third-party/xclip.el")

;; topical customizations
(load-library "_python")
(load-library "_autocomplete")
(load-library "_buffers")
(load-library "_browser")
(load-library "_ido")
(load-library "_cedet")
(load-library "_org")
(load-library "_php")
(load-library "_git")
(load-library "_yaml")
(load-library "_lua")






(put 'scroll-left 'disabled nil)
