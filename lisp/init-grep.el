(defun mpolden/grep-visit-buffer-other-window (&optional event noselect)
  "Visit grep result in another window."
  (interactive)
  (let ((current-window (selected-window)))
    (compile-goto-error event)
    (when noselect
      (select-window current-window))))

(defun mpolden/grep-visit-buffer-other-window-noselect (&optional event)
  "Visit grep result in another window, but don't select it."
  (interactive)
  (mpolden/grep-visit-buffer-other-window event t))

(defun mpolden/grep-mode-buffer-local-variables ()
  ;; wrap lines
  (setq-local truncate-lines nil))

(use-package grep
  :demand t ;; this cannot lazy load as bindings are inside a mode map

  :hook (grep-mode . mpolden/grep-mode-buffer-local-variables)

  :bind (:map grep-mode-map
              ;; make C-o and o behave as in dired
              ("o" . mpolden/grep-visit-buffer-other-window)
              ("C-o" . mpolden/grep-visit-buffer-other-window-noselect)
              ;; n and p changes line as in ag-mode
              ("n" . compilation-next-error)
              ("p" . compilation-previous-error)))

(provide 'init-grep)
