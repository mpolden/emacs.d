;;; init-python.el --- configure python language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/python-find-virtualenv ()
  "Find a virtual env directory located at the project root."
  (when-let* ((venv-dirs '(".venv" "venv" "bin/venv"))
              (project (project-current))
              (root (project-root project)))
    (seq-find (lambda (dir) (file-directory-p (expand-file-name dir root)))
              venv-dirs)))

(defun mpolden/python-mode-buffer-local-variables ()
  "Set buffer-local variables for `python-mode'."
  ;; highlight lines longer than 88 characters
  (setq-local fill-column 88)
  ;; use flat index in imenu
  (setq-local imenu-create-index-function
              'python-imenu-create-flat-index)
  ;; set virtualenv directory
  (setq-local python-shell-virtualenv-root (mpolden/python-find-virtualenv))
  ;; use pylsp if present inside virtualenv
  (when-let* ((lsp-server (expand-file-name
                           "bin/pylsp" python-shell-virtualenv-root))
              ((file-executable-p lsp-server)))
    (setq-local eglot-server-programs `((python-mode . (,lsp-server))))))

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :hook (python-mode . mpolden/python-mode-buffer-local-variables))

(provide 'init-python)

;;; init-python.el ends here
