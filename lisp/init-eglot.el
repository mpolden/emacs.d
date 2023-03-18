;;; init-eglot.el --- configure lsp integration  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/inhibit-format-before-save nil
  "List of modes where `eglot-format' should not be run before saving the buffer.")

(defvar mpolden/inhibit-organize-imports-before-save nil
  "List of modes where `eglot-code-action-organize-imports' should not be run before saving the buffer.")

(defvar mpolden/inhibit-lsp nil
  "List of modes where `eglot-ensure' should not be called to enable LSP integration.")

(defun mpolden/eglot-organize-imports ()
  "Organize imports."
  ;; this is a workaround for eglot-code-action-organize-imports not working
  ;; https://github.com/joaotavora/eglot/issues/1132
  ;; https://github.com/joaotavora/eglot/issues/574#issuecomment-1401023985
  (interactive)
  (eglot-code-actions nil nil "source.organizeImports" t))

(defun mpolden/format-before-save ()
  "Format buffer before saving."
  (unless (member major-mode mpolden/inhibit-format-before-save)
    (eglot-format)))

(defun mpolden/organize-imports-before-save ()
  "Organize imports before saving buffer."
  (unless (member major-mode mpolden/inhibit-organize-imports-before-save)
    (mpolden/eglot-organize-imports)))

(defun mpolden/eglot-before-save ()
  "All actions that may run before saving buffer."
  (unless (member major-mode mpolden/inhibit-lsp)
    (mpolden/format-before-save)
    (mpolden/organize-imports-before-save)))

(defun mpolden/eglot-ensure ()
  "Enable Eglot for current `major-mode'."
  (unless (member major-mode mpolden/inhibit-lsp)
    (eglot-ensure)))

(defun mpolden/gfm-unescape-string (string)
  "Remove backslash-escape of punctuation characters in STRING."
  ;; https://github.github.com/gfm/#backslash-escapes
  (replace-regexp-in-string "[\\\\]\\([][!\"#$%&'()*+,./:;<=>?@\\^_`{|}~-]\\)"
                            "\\1"
                            string))

(defun mpolden/eglot-server-program (&optional interactive)
  "Return a LSP server program for the current `major-mode'.
If toolbox is in PATH, prefix the server program with \"toolbox
run\". Optional argument INTERACTIVE has no effect, but must be
present to satisfy `eglot-server-programs'."
  (when-let* ((programs '((go-mode . "gopls")
                          (python-mode . "pylsp")
                          (rust-mode . "rust-analyzer")
                          (java-mode . "jdtls")))
              (program (cdr (assoc major-mode programs))))
    (if (executable-find "toolbox" (file-remote-p buffer-file-name))
        (list "toolbox" "run" program)
      (list program))))

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
              ("C-c o" . mpolden/eglot-organize-imports)
              ;; C-c q shows code actions (quickfix)
              ("C-c q" . eglot-code-actions))
  :config
  ;; https://github.com/joaotavora/eglot/issues/333
  ;; https://github.com/jrblevin/markdown-mode/issues/377
  (advice-add 'eglot--format-markup
              :filter-return
              'mpolden/gfm-unescape-string)
  ;; run some servers through toolbox
  (add-to-list 'eglot-server-programs
               '(prog-mode . mpolden/eglot-server-program)))

(provide 'init-eglot)

;;; init-eglot.el ends here
