(require 'eshell)
(require 'term)

(defun eshell-other-window (&optional noselect)
  "Create an interactive Eshell buffer in another window."
  (interactive)
  (with-current-buffer (get-buffer-create eshell-buffer-name)
    (unless (eq major-mode 'eshell-mode)
      (eshell-mode)))
  (let ((current-window (selected-window))
        (current-directory default-directory))
    (switch-to-buffer-other-window eshell-buffer-name)
    ;; change directory to the current buffer directory
    (unless (equal default-directory current-directory)
      (eshell/cd current-directory)
      (eshell-reset))
    (when noselect
      (select-window current-window))))

(defun ansi-term-other-window (&optional noselect)
  "Start a terminal-emulator in another window. Adapted from
`ansi-term'."
  (interactive)
  (let ((current-window (selected-window))
        (buf-name (generate-new-buffer-name "*ansi-term*"))
        (shell (or (getenv "ESHELL")
                   (getenv "SHELL")
                   "/bin/sh")))
    (term-ansi-make-term buf-name shell)
    (with-current-buffer buf-name
      (term-mode)
      (term-char-mode)
      (let (term-escape-char)
        (term-set-escape-char ?\C-x)))
    (switch-to-buffer-other-window buf-name)
    (when noselect
      (select-window current-window))))

(global-set-key (kbd "C-c k") 'ansi-term-other-window)

(provide 'init-shell)
