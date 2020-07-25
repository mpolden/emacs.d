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

(defun grep-mode-buffer-local-variables ()
  ;; wrap lines
  (setq-local truncate-lines nil))

(use-package grep
  :ensure nil ;; package is bundled with emacs
  :demand t ;; this cannot lazy load as bindings are inside a mode map

  :hook (grep-mode . grep-mode-buffer-local-variables)

  :bind (:map grep-mode-map
              ;; make C-o and o behave as in dired
              ("o" . grep-visit-buffer-other-window)
              ("C-o" . grep-visit-buffer-other-window-noselect)
              ;; n and p changes line as in ag-mode
              ("n" . compilation-next-error)
              ("p" . compilation-previous-error)))

(provide 'init-grep)
