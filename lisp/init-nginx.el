(use-package nginx-mode
  :mode
  ;; sites and ansible playbook files
  ("/nginx/\\(?:sites-\\(?:available\\|enabled\\)\\|files/.*/\\)" .
   nginx-mode))

(provide 'init-nginx)
