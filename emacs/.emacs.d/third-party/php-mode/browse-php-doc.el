;; Roberto Aloi
;; http://aloiroberto.wordpress.com

;; This is code is based on Magnus Henoch's browse-erlang-doc

;; This code is released under GNUGPLv3 licence.

(defvar browse-php-doc-history nil)
(defun browse-php-doc (module)
  "Open documentation for php module MODULE in a web browser.
See `browse-url-browser-function'."
  (interactive
   (let* ((files
	   (append
	    (file-expand-wildcards
	     (concat phpdoc-root-dir
		     "/*.html"))))
	  (completion-table
	   (mapcar
	    (lambda (file)
	      (cons (file-name-sans-extension
		     (file-name-nondirectory file))
		    file))
	    files))
	  (module-name (completing-read "Search: "
					completion-table
					nil t nil
					'browse-php-doc-history)))
     (list (cdr (assoc module-name completion-table)))))
  (browse-url-of-file module))
