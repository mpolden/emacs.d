;;; init-ivy.el --- configure ivy  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;; ivy uses flx sorting if it's installed
(use-package flx
  :ensure t)

(use-package ivy
  :ensure t
  :after flx
  :diminish ivy-mode
  :init
  ;; use fuzzy matching by default
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

  :config
  (ivy-mode 1))

(provide 'init-ivy)

;;; init-ivy.el ends here
