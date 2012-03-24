(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-agenda-files (list "~/org/"))
(setq org-log-done 'time)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(add-hook 'org-mode-hook 'turn-on-font-lock)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(add-hook 'org-mode-hook
          (lambda ()
            (progn
              (if window-system
                  nil
                (progn
                  (define-key org-mode-map "\C-\M-j" 'org-meta-return)
                  (define-key org-mode-map "\C-j"
                    'org-insert-heading-respect-content)))
              (local-set-key (kbd "C-c p") 'org-insert-property-drawer)
              (local-set-key (kbd "C-c C-h s") 'org-insert-subheading)
              (local-set-key (kbd "C-c C-h t") 'org-insert-todo-heading)
              (local-set-key (kbd "C-c C-h C-t s") 'org-insert-todo-subheading))))


;; mobile-org
(setq org-mobile-directory "/dlacewell@ticklestep:/home/dlacewell/org")
(add-hook 'org-mobile-post-push-hook
  (lambda () (shell-command "scp -r ~/org/* dlacewell@ticklestep:/home/dlacewell/org")))
(add-hook 'org-mobile-pre-pull-hook
  (lambda () (shell-command "scp dlacewell@ticklestep:/home/dlacewell/org/mobileorg.org ~/org/ ")))
(add-hook 'org-mobile-post-pull-hook
  (lambda () (shell-command "scp ~/org/mobileorg.org dlacewell@ticklestep:/home/dlacewell/org")))
