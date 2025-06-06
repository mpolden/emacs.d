;;; init-gptel.el --- llm client  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/gptel-mode-buffer-local-variables ()
  "Set buffer-local variables for `gptel-mode'."
  (setq-local default-directory
              (expand-file-name "chat" org-directory))
  (set-visited-file-name (concat (file-name-sans-extension
                                  (expand-file-name (buffer-name)))
                                 ".org"))
  (visual-line-mode 1))

(use-package gptel
  :ensure t
  :after org
  :bind (("C-c h" . gptel))
  :init
  ;; use org-mode syntax
  (setq gptel-default-mode 'org-mode)
  ;; soft-wrap text
  :hook (gptel-mode . mpolden/gptel-mode-buffer-local-variables))

(provide 'init-gptel)

;;; init-gptel.el ends here
