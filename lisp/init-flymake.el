;;; init-flymake.el --- configure flymake  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package flymake
  :bind (:map flymake-mode-map
              ;; C-c m l shows a list of all errors
              ("C-c m l" . flymake-show-buffer-diagnostics)
              ;; C-c m n/p navigates to next/previous error
              ("C-c m n" . flymake-goto-next-error)
              ("C-c m p" . flymake-goto-prev-error)))

(provide 'init-flymake)

;;; init-flymake.el ends here
