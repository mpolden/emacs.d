;;; init-yaml.el --- configure yaml language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package yaml-mode
  :mode ("\\.yml\\'" . yaml-mode)
  :ensure t)

(provide 'init-yaml)

;;; init-yaml.el ends here
