;; install package
(require-package 'ag)

(require 'ag)

;; reuse search results buffer
(setq ag-reuse-buffers t)

;; highlight search term in results
(setq ag-highlight-search t)

;; keybinding
(global-set-key (kbd "C-c a") 'ag-project)

(defun ag-visit-buffer-other-window (&optional event noselect)
  "Visit ag result in another window."
  (interactive)
  (let ((current-window (selected-window)))
    ;; ag-mode uses compile-goto-error for visiting the result
    (compile-goto-error event)
    (when noselect
      (select-window current-window))))

(defun ag-visit-buffer-other-window-noselect (&optional event)
  "Visit ag result in another window, but don't select it."
  (interactive)
  (ag-visit-buffer-other-window event t))

(add-hook 'ag-mode-hook
          (lambda ()
            ;; wrap lines
            (setq truncate-lines nil)
            ;; make C-o and o behave as in dired
            (define-key ag-mode-map (kbd "C-o")
              'ag-visit-buffer-other-window-noselect)
            (define-key ag-mode-map (kbd "o")
              'ag-visit-buffer-other-window)))

(provide 'init-ag)
