(autoload 'wl "wl" "Wanderlust" t)

;; IMAP
(setq elmo-imap4-default-server "imap.gmail.com"
      elmo-imap4-default-user "dlacewell@gmail.com"
      elmo-imap4-default-authenticate-type 'clear
      elmo-imap4-default-port '993
      elmo-imap4-default-stream-type 'ssl
      elmo-imap4-use-modified-utf7 t)

;; SMTP
(setq wl-smtp-connection-type 'starttls
      wl-smtp-posting-port 587
      wl-smtp-authenticate-type "plain"
      wl-smtp-posting-user "dlacewell"
      wl-smtp-posting-server "smtp.gmail.com"
      wl-local-domain "gmail.com"
      wl-message-id-domain "niu.edu")

;; wanderlust folders
(setq wl-folder-check-async t
      wl-stay-folder-window t
      wl-folder-window-width 20
      wl-folder-desktop-name "Email"
      wl-default-folder "%inbox"
      wl-default-spec "%"
      wl-draft-folder "%[Gmail]/Drafts"
      wl-trash-folder "%[Gmail]/Trash")

;; wanderlust summary
(setq wl-summary-line-format "%n%T%P %D/%M (%W) %h:%m %t%[%15(%c %f%) %] %s"
      wl-summary-width 127
      wl-auto-select-next 'unread
      wl-message-ignored-field-list '("^.*:")
      wl-message-visible-field-list
      '("^To:"
	"^Cc:"
	"^From:"
	"^Subject:"
	"^Date:")
      wl-message-sort-field-list
      '("^From:"
	"^To:"
	"^Subject:"
	"^Cc:"
	"^Date:"))

;; wanderlust behavior

(setq wl-forward-subject-prefix "Fwd: ") ;; use "Fwd:" not "Forward:"

;; invert reply-to targets (default: sender)
(setq wl-draft-reply-without-argument-list
 '(("Reply-To" ("Reply-To") nil nil)
   ("Mail-Reply-To" ("Mail-Reply-To") nil nil)
   ("From" ("From") nil nil)))
(setq wl-draft-reply-with-argument-list
 '(("Followup-To" nil nil ("Followup-To"))
   ("Mail-Followup-To" ("Mail-Followup-To") nil ("Newsgroups"))
   ("Reply-To" ("Reply-To") ("To" "Cc" "From") ("Newsgroups"))
   ("From" ("From") ("To" "Cc") ("Newsgroups"))))


;; misc
(setq elmo-imap4-use-modified-utf7 t)

(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))