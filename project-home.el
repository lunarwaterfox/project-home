(defvar project-home)

(defun project-home-query-home (dir)
  "query user to point home director"
  (interactive "DSetup home directory: ")
  (setq project-home dir))

(provide 'project-home)
