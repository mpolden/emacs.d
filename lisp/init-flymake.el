(use-package flymake
  :bind (:map flymake-mode-map
              ;; C-d shows a list of all errors
              ("C-c d" . flymake-show-diagnostics-buffer)))

(provide 'init-flymake)
