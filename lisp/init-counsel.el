;;; init-counsel.el --- improve ivy integration   -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x) ;; uses amx when present
         ("C-c i" . counsel-imenu)))

(provide 'init-counsel)

;;; init-counsel.el ends here
