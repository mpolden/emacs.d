(use-package yaml-mode
  :ensure t
  :mode
  ;; ansible group_vars and host_vars
  ("/\\(group\\|host\\)_vars/" . yaml-mode))

(provide 'init-yaml)
