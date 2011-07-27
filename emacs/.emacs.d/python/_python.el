;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python mode customizations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;There are TWO python modes
; 1) Tim Peter's python-mode.el -- this is the standard/legacy way
; 2) Dave Love's python.el -- this is when Dave Love got frustrated
;                             that python-mode wasn't accepting his patches
;
;The following directory has a .nosearch file in it therefore it not in
;the current load-path and the default python-mode will be used instead
;The following loads Dave Love's python mode:
(add-to-list 'load-path "~/.emacs.d/third-party/dave-loves-python-mode")
(load-library "python")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
	        interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
		        (set-variable 'py-indent-offset 4)
			    (set-variable 'py-smart-indentation nil)
			        (set-variable 'indent-tabs-mode nil) 
				    ;;(highlight-beyond-fill-column)
                    (define-key python-mode-map "\C-m" 'newline-and-indent)
		        ;(pabbrev-mode)
		        ;(abbrev-mode)
		     )
      )
)

;; Autofill inside of comments
(require 'auto-complete)
(defun python-auto-fill-comments-only ()
  (auto-fill-mode 1)
  (set (make-local-variable 'fill-nobreak-predicate)
       (lambda ()
         (not (python-in-string/comment)))))
(add-hook 'python-mode-hook
          (lambda ()
            (python-auto-fill-comments-only)))

;; ropemacs

(defvar ac-ropemacs-loaded nil)
(defun ac-ropemacs-require ()
  (unless ac-ropemacs-loaded
    (pymacs-load "ropemacs" "rope-")
    (if (boundp 'ropemacs-enable-autoimport)
        (setq ropemacs-enable-autoimport t))
    (setq ac-ropemacs-loaded t)))

(defun ac-ropemacs-setup ()
  (ac-ropemacs-require)
  (setq ac-sources '(ac-source-ropemacs)))
  ;(setq ac-omni-completion-sources '(("\\." ac-source-ropemacs))))

(defun ac-ropemacs-initialize ()
  (autoload 'pymacs-apply "pymacs")
  (autoload 'pymacs-call "pymacs")
  (autoload 'pymacs-eval "pymacs" nil t)
  (autoload 'pymacs-exec "pymacs" nil t)
  (autoload 'pymacs-load "pymacs" nil t)
  (add-hook 'python-mode-hook 'ac-ropemacs-setup)
  t)

(defvar ac-ropemacs-completions-cache nil)
(defvar ac-source-ropemacs
  '((init
     . (lambda ()
         (setq ac-ropemacs-completions-cache
               (mapcar
                (lambda (completion)
                  (concat ac-prefix completion))
                (ignore-errors
                  (rope-completions))))))
    (candidates . ac-ropemacs-completions-cache)))

(ac-ropemacs-initialize)