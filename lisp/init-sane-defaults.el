;;; init-sane-defaults.el --- configure sane defaults  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/save-buffer (_frame)
  "Save the current buffer if it's visiting a file."
  (when-let* ((buf (current-buffer))
              (_name (buffer-file-name buf)))
    (with-current-buffer buf
      (save-buffer))))

;; use soft tabs
(setopt indent-tabs-mode nil)

;; make prompts always accept y or n
(setopt use-short-answers t)

;; no confirmation for non-existent files or buffers
(setopt confirm-nonexistent-file-or-buffer nil)

;; disable audible bell
(setopt ring-bell-function #'ignore)

;; use smooth scrolling if custom implementation is not available
(unless (bound-and-true-p mac-mouse-wheel-smooth-scroll)
  (setopt pixel-scroll-precision-mode t))

;; reload buffers automatically when files change on disk
(use-package autorevert
  :diminish auto-revert-mode
  :init
  ;; revert buffers quietly
  (setopt auto-revert-verbose nil)
  ;; enable mode
  (setopt global-auto-revert-mode t))

;; save buffer when selected window changes
(add-hook 'window-selection-change-functions 'mpolden/save-buffer)

;; integrate with X clipboard
(setopt select-enable-clipboard t)

;; ensure clipboard strings are saved into kill ring
(setopt save-interprogram-paste-before-kill t)

;; move deleted files to trash
(setopt delete-by-moving-to-trash t)

;; show keystrokes immediately
(setopt echo-keystrokes 0.01)

;; add directory to buffer name if filename is not unique
(setopt uniquify-buffer-name-style 'forward)

;; tetris score file
(setopt tetris-score-file (expand-file-name "tetris" user-emacs-directory))

;; automatically determine major-mode for newly created buffers
(setopt major-mode
        (lambda ()
          (unless buffer-file-name
            (let ((buffer-file-name (buffer-name)))
              (set-auto-mode t)))))

;; single space ends a sentence
(setopt sentence-end-double-space nil)

;; default to 80 chars fill-column
(setopt fill-column 80)

;; confirm when exiting
(setopt confirm-kill-emacs #'y-or-n-p)

;; backup files
(setopt make-backup-files t
        backup-directory-alist `(("." . ,(expand-file-name "backup"
                                                           user-emacs-directory)))
        backup-by-copying t
        delete-old-versions t
        version-control t)

;; preserve point position when scrolling
(setopt scroll-preserve-screen-position 'always)

;; always add newline at the end of the file
(setopt require-final-newline t)

;; remember position in previously visited files
(use-package saveplace
  :init
  (setopt save-place-mode t))

;; remember window configurations
(use-package winner
  :init
  (setopt winner-mode t))

;; show match numbers in the search prompt
(setopt isearch-lazy-count t)

;; monday is the first day of the week
;; show week numbers
(setopt calendar-week-start-day 1
        calendar-intermonth-text
        '(propertize
          (format "%2d"
                  (car
                   (calendar-iso-from-absolute
                    (calendar-absolute-from-gregorian (list month day year)))))
          'font-lock-face 'font-lock-function-name-face))

;; do not ask to use a local dictionary server
(setopt dictionary-server "dict.org")

;; delete trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; make scripts executable when saving
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; respect editorconfig
(use-package editorconfig
  :init
  (setopt editorconfig-mode t))

(provide 'init-sane-defaults)

;;; init-sane-defaults.el ends here
