;;; init-sane-defaults.el --- configure sane defaults  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;; use soft tabs
(setq-default indent-tabs-mode nil)

;; make prompts accept y or n
(defalias 'yes-or-no-p #'y-or-n-p)

;; no confirmation for non-existent files or buffers
(setq confirm-nonexistent-file-or-buffer nil)

;; disable audible bell
(setq ring-bell-function #'ignore)

;; use smooth scrolling if custom implementation is not available
(unless (bound-and-true-p mac-mouse-wheel-smooth-scroll)
  (pixel-scroll-precision-mode 1))

;; reload buffers automatically when files change on disk
(use-package autorevert
  :diminish auto-revert-mode
  :init
  ;; revert buffers quietly
  (setq auto-revert-verbose nil)
  :config
  (global-auto-revert-mode 1))

;; integrate with X clipboard
(setq select-enable-clipboard t)

;; ensure clipboard strings are saved into kill ring
(setq save-interprogram-paste-before-kill t)

;; move deleted files to trash
(setq delete-by-moving-to-trash t)

;; show keystrokes immediately
(setq echo-keystrokes 0.01)

;; add directory to buffer name if filename is not unique
(setq uniquify-buffer-name-style 'forward)

;; tetris score file
(setq tetris-score-file (expand-file-name "tetris" user-emacs-directory))

;; automatically determine major-mode for newly created buffers
(setq-default major-mode
              (lambda ()
                (unless buffer-file-name
                  (let ((buffer-file-name (buffer-name)))
                    (set-auto-mode t)))))

;; single space ends a sentence
(setq-default sentence-end-double-space nil)

;; default to 80 chars fill-column
(setq-default fill-column 80)

;; confirm when exiting
(setq confirm-kill-emacs #'y-or-n-p)

;; backup files
(setq make-backup-files t
      backup-directory-alist `(("." . ,(expand-file-name "backup"
                                                         user-emacs-directory)))
      backup-by-copying t
      delete-old-versions t
      version-control t)

;; preserve point position when scrolling
(setq scroll-preserve-screen-position 'always)

;; always add newline at the end of the file
(setq require-final-newline t)

;; remember position in previously visited files
(use-package saveplace
  :config
  (save-place-mode 1))

;; remember window configurations
(use-package winner
  :config
  (winner-mode 1))

;; show match numbers in the search prompt
(setq isearch-lazy-count t)

;; monday is the first day of the week
;; show week numbers
(setq calendar-week-start-day 1
      calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'font-lock-function-name-face))

;; do not ask to use a local dictionary server
(setq dictionary-server "dict.org")

;; delete trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; make scripts executable when saving
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; respect editorconfig
(use-package editorconfig
  :config
  (editorconfig-mode 1))

(provide 'init-sane-defaults)

;;; init-sane-defaults.el ends here
