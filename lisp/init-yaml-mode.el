(use-package yaml-mode
  :mode
  ;; ansible group_vars and host_vars
  ("/\\(group\\|host\\)_vars/" . yaml-mode)

  :config
  ;; don't override C-j
  (define-key yaml-mode-map (kbd "C-j") nil)

  ;; disable electric indent
  (add-hook 'yaml-mode-hook
            (lambda () (setq-local electric-indent-mode nil))))

(provide 'init-yaml-mode)
