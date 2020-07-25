;; enable amx-mode for smarter candidates in M-x
(use-package amx
  :ensure t
  :after ivy
  :config
  (amx-mode 1))

(provide 'init-amx)
