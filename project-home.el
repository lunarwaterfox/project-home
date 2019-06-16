(defgroup project-home nil
  "Support a project environment."
  :group 'development)

(defcustom project-home-history nil
  "Project home history."
  :type '(alist :key-type symbol :value-type string)
  :group 'project-home)

(defvar project-home-list nil)

(defun project-home-query-directory (&optional recent)
  "Query user to point home director."
  (read-directory-name "Setup home directory: " recent nil t))

(defun project-home-dir-by-key (key)
  "Export project home dir by key."
  (let ((dir (alist-get key project-home-list)))
    (if dir dir (project-home-query-home key))))


(defun project-home-query-home (key)
  "Query home dir of a project by key."
  (let* ((recent (alist-get key project-home-history))
         (dir (project-home-query-directory recent))
         (pair (cons key dir))
         (home-list (assq-delete-all key project-home-list))
         (history-list (assq-delete-all key project-home-history)))
    (setq project-home-list (cons pair home-list))
    (customize-save-variable 'project-home-history (cons pair history-list))
    dir))

(provide 'project-home)
