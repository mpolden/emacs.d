;;; init-theme.el --- configure theme  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/switch-theme ()
  "Disable any currently enabled themes and load a new one."
  (interactive)
  (mapcar #'disable-theme custom-enabled-themes)
  (call-interactively 'load-theme))

(use-package doom-themes
  :ensure t
  :if (display-graphic-p)
  :config
  (load-theme 'doom-one t))

(provide 'init-theme)

;;; init-theme.el ends here
