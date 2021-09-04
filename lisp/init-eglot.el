;;; init-eglot.el --- configure lsp integration  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/inhibit-format-before-save nil
  "List of modes where `eglot-format' should not be run before saving the buffer.")

(defvar mpolden/inhibit-organize-imports-before-save nil
  "List of modes where `eglot-code-action-organize-imports' should not be run before saving the buffer.")

(defun mpolden/format-before-save ()
  "Format buffer before saving."
  (unless (member major-mode mpolden/inhibit-format-before-save)
    (eglot-format)))

(defun mpolden/organize-imports-before-save ()
  "Organize imports before saving buffer."
  (unless (member major-mode mpolden/inhibit-organize-imports-before-save)
    (call-interactively 'eglot-code-action-organize-imports)))

(defun mpolden/eglot-before-save ()
  "All actions that may run before saving buffer."
  (mpolden/format-before-save)
  (mpolden/organize-imports-before-save))

(defun mpolden/gfm-unescape-string (string)
  "Remove backslash-escape of punctuation characters in STRING."
  ;; https://github.github.com/gfm/#backslash-escapes
  (replace-regexp-in-string "[\\\\]\\([][!\"#$%&'()*+,./:;<=>?@\\^_`{|}~-]\\)"
                            "\\1"
                            string))

(use-package eglot
  :ensure t
  :init
  ;; eglot passes tab-width as tab size to the lsp server, but most language
  ;; servers treat this as an indentation width
  ;; https://github.com/joaotavora/eglot/issues/157
  ;;
  ;; set a default value that fits most languages
  (setq-default tab-width 4)
  :hook
  ;; load eglot automatically for these modes
  ((go-mode . eglot-ensure)
   (java-mode . eglot-ensure)
   (python-mode . eglot-ensure)
   (rust-mode . eglot-ensure)
   (before-save . mpolden/eglot-before-save))

  :bind (:map eglot-mode-map
              ;; C-c r renames identifier
              ("C-c r" . eglot-rename)
              ;; C-c f formats buffer
              ("C-c f" . eglot-format)
              ;; C-c o organizes imports
              ("C-c o" . eglot-code-action-organize-imports))
  :config
  ;; https://github.com/joaotavora/eglot/issues/333
  ;; https://github.com/jrblevin/markdown-mode/issues/377
  (advice-add 'eglot--format-markup
              :filter-return
              'mpolden/gfm-unescape-string))

(provide 'init-eglot)

;;; init-eglot.el ends here
