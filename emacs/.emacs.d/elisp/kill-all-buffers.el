(defun kill-all-buffers ()
  (interactive)
  (let ((blist (buffer-list)) (count 0) )
    (while blist
      (condition-case err
	  (let ((to-kill (car blist)))
;;	    (insert (format "Blist: %s\n\n" blist))
;;	    (insert (format "Trying: %s\n\n" to-kill))
	    (kill-buffer to-kill))
	(error (insert (format "The error was: %s\n\n" err))))
      (setq blist (cdr blist)))))


























































