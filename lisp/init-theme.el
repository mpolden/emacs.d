;;; init-theme.el --- configure theme
;;; Commentary:
;;; Code:

(use-package doom-themes
  :ensure t
  :if (display-graphic-p)
  :config
  (load-theme 'doom-one t))

(provide 'init-theme)

;;; init-theme.el ends here
