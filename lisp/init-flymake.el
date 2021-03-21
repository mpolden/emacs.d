;;; init-flymake.el --- configure flymake  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package flymake
  :bind (:map flymake-mode-map
              ;; C-d shows a list of all errors
              ("C-c d" . flymake-show-diagnostics-buffer)))

(provide 'init-flymake)

;;; init-flymake.el ends here
