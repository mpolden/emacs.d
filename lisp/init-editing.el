;; install packages
(require-package 'move-text)
(require-package 'whole-line-or-region)

(require 'move-text)
(require 'whole-line-or-region)
(require 'misc)
(require 'whitespace)
(require 'imenu)

;; disable backup files
(setq make-backup-files nil)

;; preserve point position when scrolling
(setq scroll-preserve-screen-position 'always)

;; make imenu automatically rescan buffers
(setq imenu-auto-rescan t)

;; enable electric-indent-mode
(electric-indent-mode 1)

;; use sh-mode for various zsh files
(add-to-list 'auto-mode-alist
             '("z\\(sh[^/]*\\|login\\|logout\\|profile\\|preztorc\\)\\'"
               . sh-mode))

;; use conf-mode for Procfile
(add-to-list 'auto-mode-alist '("/Procfile\\'" . conf-mode))

;; cut or copy the currrent line if no region is active
(whole-line-or-region-mode 1)

;; bind keys for moving lines up and down
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

;; undo
(global-set-key (kbd "C-u") 'undo)

;; use zap-up-to-char instead of zap-to-char
(global-set-key (kbd "M-z") 'zap-up-to-char)

;; open line below or above current line
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "C-o") 'open-line-below)
(global-set-key (kbd "C-S-o") 'open-line-above)

;; swap RET and C-j
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-j") 'newline)

;; C-x k kills current buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; C-c r reverts buffer without confirmation
(defun revert-buffer-without-query ()
  "Revert the current buffer without confirmation."
  (interactive)
  (revert-buffer t t))

(global-set-key (kbd "C-c r") 'revert-buffer-without-query)

;; C-c . repeats last command
(global-set-key (kbd "C-c .") 'repeat)

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
  (if (eq 'python-mode major-mode)
      (message "Skipping indent-buffer in python-mode.")
    (indent-buffer)))

(global-set-key (kbd "C-c w") 'cleanup-buffer)

;; keybindings for navigating elisp sources
(define-key 'help-command (kbd "C-l") 'find-library)
(define-key 'help-command (kbd "C-f") 'find-function)
(define-key 'help-command (kbd "C-k") 'find-function-on-key)

;; join line
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line -1)))

;; imenu (will use ido completion if ido-ubiquitous-mode is enabled)
(global-set-key (kbd "C-c i") 'imenu)

(provide 'init-editing)
