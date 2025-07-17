;;; init-eglot.el --- configure lsp integration  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/inhibit-format-before-save nil
  "List of modes where `eglot-format' should not be run before saving the buffer.")

(defvar mpolden/inhibit-organize-imports-before-save nil
  "List of modes where `eglot-code-action-organize-imports' should not be run before saving the buffer.")

(defvar mpolden/inhibit-lsp nil
  "List of modes where `eglot-ensure' should not be called to enable LSP integration.")

(defun mpolden/major-mode-member (modes)
  "Return non-nil if `major-mode' is an element of MODES."
  (if (listp modes)
      (member major-mode modes)
    modes))

(defun mpolden/format-before-save ()
  "Format buffer before saving."
  (unless (mpolden/major-mode-member mpolden/inhibit-format-before-save)
    (eglot-format)))

(defun mpolden/organize-imports-before-save ()
  "Organize imports before saving buffer."
  (unless (mpolden/major-mode-member mpolden/inhibit-organize-imports-before-save)
    (call-interactively 'eglot-code-action-organize-imports)))

(defun mpolden/eglot-before-save ()
  "All actions that may run before saving buffer."
  (unless (mpolden/major-mode-member mpolden/inhibit-lsp)
    (mpolden/format-before-save)
    (mpolden/organize-imports-before-save)))

(defun mpolden/eglot-ensure ()
  "Enable Eglot for current `major-mode'."
  (unless (mpolden/major-mode-member mpolden/inhibit-lsp)
    (eglot-ensure)))

(use-package eglot
  :ensure t
  :init
  ;; eglot passes tab-width as tab size to the lsp server, but most language
  ;; servers treat this as an indentation width
  ;; https://github.com/joaotavora/eglot/issues/157
  ;;
  ;; set a default value that fits most languages
  (setopt tab-width 4)
  :hook
  ;; load eglot automatically for these modes
  ((go-mode . mpolden/eglot-ensure)
   (java-mode . mpolden/eglot-ensure)
   (python-mode . mpolden/eglot-ensure)
   (rust-mode . mpolden/eglot-ensure)
   (before-save . mpolden/eglot-before-save))

  :bind (:map eglot-mode-map
              ;; C-c r renames identifier
              ("C-c r" . eglot-rename)
              ;; C-c f formats buffer
              ("C-c f" . eglot-format)
              ;; C-c o organizes imports
              ("C-c o" . eglot-code-action-organize-imports)
              ;; C-c q shows code actions (quickfix)
              ("C-c q" . eglot-code-actions)))

(provide 'init-eglot)

;;; init-eglot.el ends here
