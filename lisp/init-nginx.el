;; install package
(require-package 'nginx-mode)

;; load nginx-mode
(require 'nginx-mode)

;; sites and ansible playbook files
(add-to-list 'auto-mode-alist
             '("/nginx/\\(?:sites-\\(?:available\\|enabled\\)\\|files/.*/\\)" .
               nginx-mode))

(provide 'init-nginx)
