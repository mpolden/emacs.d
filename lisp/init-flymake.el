;;; init-flymake.el --- configure flymake  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package flymake
  :bind (:map flymake-mode-map
              ;; C-c d l shows a list of all errors
              ("C-c d l" . flymake-show-diagnostics-buffer)
              ;; C-c d n/p navigates to next/previous error
              ("C-c d n" . flymake-goto-next-error)
              ("C-c d p" . flymake-goto-prev-error)))

(provide 'init-flymake)

;;; init-flymake.el ends here
