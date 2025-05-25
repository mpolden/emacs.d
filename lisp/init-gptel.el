;;; init-gptel.el --- llm client  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package gptel
  :ensure t
  :bind (("C-c h" . gptel))
  :init
  ;; use org-mode syntax
  (setq gptel-default-mode 'org-mode)
  ;; soft-wrap text
  :hook (gptel-mode . visual-line-mode))

(provide 'init-gptel)

;;; init-gptel.el ends here
