(require 'python)
(require 'magit)

(defun nosetests-command-at-point ()
  "Create a nosetests command with the test at point as the argument."
  (if (eq 'python-mode major-mode)
      (let* ((git-root (magit-get-top-dir))
             (file-rel-name (when git-root (file-relative-name
                                            buffer-file-name git-root))))
        (if file-rel-name
            (let ((function (which-function)))
              (if function
                  (concat "nosetests " file-rel-name ":" function)
                (message "Could not determine function at point.")
                nil))
          (message "Buffer is not visiting a file, or file is not in git.")
          nil))
    (message "Not in python-mode.")
    nil))

(defun kill-nosetests-command-at-point ()
  "Kill nosetests command at point."
  (interactive)
  (let ((command (nosetests-command-at-point)))
    (when command
      (kill-new command)
      (message "Killed nosetests command."))))

(add-hook 'python-mode-hook
          (lambda ()
            ;; disable electric indent
            (setq-local electric-indent-mode nil)
            ;; highlight lines longer than 79 characters (pep8)
            (setq-local fill-column 79)
            ;; use flat index in imenu
            (setq-local imenu-create-index-function
                        'python-imenu-create-flat-index)
            ;; add nosetest command to kill ring
            (define-key python-mode-map (kbd "C-c t")
              'kill-nosetests-command-at-point)))

(provide 'init-python-mode)
