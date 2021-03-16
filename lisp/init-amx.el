;;; init-amx.el --- configure a better M-x
;;; Commentary:
;;; Code:

(use-package amx
  :ensure t
  :after ivy
  :config
  (amx-mode 1))

(provide 'init-amx)

;;; init-amx.el ends here
