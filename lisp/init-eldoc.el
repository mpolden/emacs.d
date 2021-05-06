;;; init-eldoc.el --- configure documentation viewer  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package eldoc
  :commands eldoc-mode
  :init
  ;; always display documentation in a separate buffer
  (setq eldoc-display-functions '(eldoc-display-in-buffer))
  :diminish)

(provide 'init-eldoc)

;;; init-eldoc.el ends here
