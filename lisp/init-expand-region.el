;;; init-expand-region.el --- select region by semantic units  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package expand-region
  :ensure t
  :bind (("C-c e" . 'er/expand-region)))

(provide 'init-expand-region)

;;; init-expand-region.el ends here
