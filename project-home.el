(defgroup project-home nil
  "Support a project environment."
  :group 'development)

(defcustom project-home-history nil
  "Project home history."
  :type '(alist :key-type symbol :value-type string)
  :group 'project-home)

(defvar project-home-list nil)

(defun project-home-query-home (&optional recent)
  "Query user to point home director."
  (read-directory-name "Setup home directory: " recent nil t))

(defun project-home-dir-by-key (key)
  "Export project home dir by key."
  (let ((dir (alist-get key project-home-list)))
    (unless dir
      (let ((recent (alist-get key project-home-history)))
        (setf dir (project-home-query-home recent)))
      (let ((pair (cons key dir))
            (history (assq-delete-all key project-home-history)))
        (push pair project-home-list)
        (customize-save-variable 'project-home-history (cons pair history))))
    dir))





(provide 'project-home)
