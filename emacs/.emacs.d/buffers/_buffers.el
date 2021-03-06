;; default tab-width
(setq-default tab-width 4)

;; shorter confirmation prompts
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "C-M-m") 'xterm-mouse-mode)

;; buffer browsing : C-x C-[jk]
(global-set-key (kbd "C-n") 'next-logical-line)
(global-set-key (kbd "C-p") 'previous-logical-line)
(global-set-key (kbd "C-x C-j") 'previous-buffer)
(global-set-key (kbd "C-x C-k") 'next-buffer)

;; global calculate org-tables
(add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-c r") 'org-table-iterate-buffer-tables)))

;; close all buffers : C-cx
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key "\C-cx" 'close-all-buffers)

;; scroll-in-place : [C,M]-v, [CM,MS]-v
(defun scroll-down-in-place (n)
  (interactive "p")
  (previous-line n)
  (scroll-down n))

(defun scroll-up-in-place (n)
  (interactive "p")
  (next-line n)
  (scroll-up n))

(global-set-key "\M-v" 'scroll-down-in-place)
(global-set-key "\C-v" 'scroll-up-in-place)
(global-set-key "\M-V" (lambda () (interactive) (scroll-down-in-place 6))  )
(global-set-key "\C-\M-V" (lambda () (interactive) (scroll-up-in-place 6))  )

;; minimap.el
(when (display-graphic-p)
  (require 'minimap)
  ;; enable minimap
  (global-set-key (kbd "C-c m") 'minimap-toggle))




;; search-all-buffers : F7
(defcustom search-all-buffers-ignored-files (list (rx-to-string '(and bos (or ".bash_history" "TAGS") eos)))
  "Files to ignore when searching buffers via \\[search-all-buffers]."
  :type 'editable-list)

(require 'grep)
(defun search-all-buffers (regexp prefix)
  "Searches file-visiting buffers for occurence of REGEXP.  With
prefix > 1 (i.e., if you type C-u \\[search-all-buffers]),
searches all buffers."
  (interactive (list (grep-read-regexp)
                     current-prefix-arg))
 (message "Regexp is %s; prefix is %s" regexp prefix)
  (multi-occur
   (if (member prefix '(4 (4)))
       (buffer-list)
     (remove-if
      (lambda (b) (some (lambda (rx) (string-match rx  (file-name-nondirectory (buffer-file-name b)))) search-all-buffers-ignored-files))
      (remove-if-not 'buffer-file-name (buffer-list))))

   regexp))
(global-set-key [f7] 'search-all-buffers)


;; ack-and-a-half.el
(add-to-list 'load-path "/path/to/ack-and-a-half")
(autoload 'ack-and-a-half-same "ack-and-a-half" nil t)
(autoload 'ack-and-a-half "ack-and-a-half" nil t)
(autoload 'ack-and-a-half-find-file-samee "ack-and-a-half" nil t)
(autoload 'ack-and-a-half-find-file "ack-and-a-half" nil t)
;; Create shorter aliases
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

;; themes
;; (add-to-list 'load-path "/usr/share/emacs23/site-lisp/emacs-goodies-el")
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-hober)))