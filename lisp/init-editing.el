(use-package whole-line-or-region
  :diminish whole-line-or-region-mode

  :config
  ;; cut or copy the currrent line if no region is active
  (whole-line-or-region-mode 1))

;; disable backup files
(setq make-backup-files nil)

;; preserve point position when scrolling
(setq scroll-preserve-screen-position 'always)

;; enable electric-indent-mode
(electric-indent-mode 1)

;; use sh-mode for various zsh files
(add-to-list 'auto-mode-alist
             '("z\\(sh[^/]*\\|login\\|logout\\|profile\\|preztorc\\)\\'"
               . sh-mode))

;; use zap-up-to-char instead of zap-to-char
(use-package misc
  :ensure nil

  :bind ("M-z" . zap-up-to-char))

;; swap RET and C-j
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-j") 'newline)

;; C-x k kills current buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message buffer-file-name))

(global-set-key (kbd "C-c f") 'show-file-name)

;; bind hippie-expand
(global-set-key (kbd "C-c e") 'hippie-expand)

;; whitespace cleanup
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (if (eq 'go-mode major-mode)
      (message "Skipping untabify-buffer in go-mode.")
    (untabify-buffer))
  (whitespace-cleanup)
  (if (or (eq 'python-mode major-mode) (eq 'yaml-mode major-mode))
      (message "Skipping indent-buffer in %s." major-mode)
    (indent-buffer)))

(use-package whitespace
  :bind ("C-c c" . cleanup-buffer))

;; keybindings for navigating elisp sources
(defun call-interactively-other-window (function &optional noselect)
  "Call FUNCTION interactively. Restore the current window if
NOSELECT is non-nil."
  (let ((current-window (selected-window)))
    (call-interactively function)
    (when noselect
      (select-window current-window))))

(define-key 'help-command (kbd "C-f")
  (lambda ()
    (interactive)
    (call-interactively-other-window 'find-function-other-window t)))

(define-key 'help-command (kbd "C-k")
  (lambda ()
    (interactive)
    (call-interactively-other-window 'find-function-on-key t)))

;; join line
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line -1)))

;; source: http://rejeep.github.io/emacs/elisp/2010/03/26/rename-file-and-buffer-in-emacs.html
(defun rename-this-buffer-and-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (error "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file filename new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)
               (message "File '%s' successfully renamed to '%s'" name
                        (file-name-nondirectory new-name))))))))

(global-set-key (kbd "C-c n") 'rename-this-buffer-and-file)

;; enable subword-mode in prog-mode
(use-package subword
  :ensure nil
  :diminish subword-mode
  :config
  (add-hook 'prog-mode-hook 'subword-mode))

(provide 'init-editing)
