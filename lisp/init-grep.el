(use-package grep
  :ensure nil ;; package is bundled with emacs

  :bind (:map grep-mode-map
         ;; make C-o and o behave as in dired
         ("o" . grep-visit-buffer-other-window)
         ("C-o" . grep-visit-buffer-other-window-noselect)
         ;; n and p changes line as in ag-mode
         ("n" . compilation-next-error)
         ("p" . compilation-previous-error))

  :config
  (defun grep-visit-buffer-other-window (&optional event noselect)
    "Visit grep result in another window."
    (interactive)
    (let ((current-window (selected-window)))
      (compile-goto-error event)
      (when noselect
        (select-window current-window))))

  (defun grep-visit-buffer-other-window-noselect (&optional event)
    "Visit grep result in another window, but don't select it."
    (interactive)
    (grep-visit-buffer-other-window event t))

  (add-hook 'grep-mode-hook
            (lambda ()
              ;; wrap lines
              (setq-local truncate-lines nil))))

(provide 'init-grep)
