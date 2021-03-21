;;; init-eglot.el --- configure lsp integration  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/inhibit-format-before-save nil
  "List of modes where `eglot-format' should not be run before saving the buffer.")

(defun mpolden/format-before-save ()
  "Format buffer using `eglot-format' unless explicitly inhibited in current mode."
  (unless (member major-mode mpolden/inhibit-format-before-save)
    (eglot-format)))

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
   (before-save . mpolden/format-before-save))

  :bind (:map eglot-mode-map
              ;; C-c r renames identifier
              ("C-c r" . eglot-rename)
              ;; C-c f formats buffer
              ("C-c f" . eglot-format)
              ;; C-c o organizes imports
              ("C-c o" . eglot-code-action-organize-imports))

  :config
  ;; disable symbol highlighting and documentation on hover
  (setq eglot-ignored-server-capabilites '(:documentHighlightProvider
                                           :hoverProvider)))

(provide 'init-eglot)

;;; init-eglot.el ends here
