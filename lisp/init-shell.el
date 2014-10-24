(require 'eshell)

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

(global-set-key (kbd "C-c k") 'eshell-other-window)

(provide 'init-shell)
