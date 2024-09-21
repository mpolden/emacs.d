;;; init-vertico.el --- a better completion ui  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/consult-project-function (may-prompt)
  "Return project root directory.
When no project is found and MAY-PROMPT is non-nil ask the user.

This wraps `consult--default-project-function', but ignores
remote projects."
  ;; https://github.com/minad/consult/issues/792
  (unless (file-remote-p default-directory)
    (consult--default-project-function may-prompt)))

;; save minibuffer history so that vertico can use it for sorting
(use-package savehist
  :config
  (savehist-mode 1))

;; enhanced search and navigation commands
(use-package consult
  :ensure t
  :init
  (setq consult-project-function #'mpolden/consult-project-function)
  (setq xref-show-xrefs-function #'consult-xref)
  (setq completion-in-region-function #'consult-completion-in-region)
  :bind (("C-x b" . consult-buffer)
         ("C-c i" . consult-imenu)
         ("C-c m" . consult-flymake)
         ("C-x C-r" . consult-recent-file)
         ("M-g M-g" . consult-goto-line)))

;; show rich annotations in the minibuffer
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

;; a better completion ui
(use-package vertico
  :ensure t
  :init
  ;; enable fuzzy matching
  ;; https://github.com/minad/vertico/#completion-styles-and-tab-completion
  (setq completion-styles '(basic substring partial-completion flex))
  ;; make completion case-insensitive
  (setq read-file-name-completion-ignore-case t
        read-buffer-completion-ignore-case t
        completion-ignore-case t)
  :config
  (vertico-mode 1))

;; make directory navigation behave like ido
;; https://github.com/minad/vertico/#extensions
(use-package vertico-directory
  :ensure nil
  :after vertico
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(provide 'init-vertico)

;;; init-vertico.el ends here
