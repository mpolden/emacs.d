(use-package yaml-mode
  :mode
  ;; ansible group_vars and host_vars
  ("/\\(group\\|host\\)_vars/" . yaml-mode))

(provide 'init-yaml)
