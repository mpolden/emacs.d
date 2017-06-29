;; use soft tabs
(setq-default indent-tabs-mode nil)

;; make prompts accept y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; no confirmation for non-existent files or buffers
(setq confirm-nonexistent-file-or-buffer nil)

;; disable audible bell
(setq ring-bell-function 'ignore)

;; scroll one line at a time
(setq mouse-wheel-scroll-amount
      '(1
        ((shift) . 5)
        ((control))))

;; disable scroll acceleration
(setq mouse-wheel-progressive-speed nil)

;; reload buffers automatically when files change on disk
(use-package autorevert
  :ensure nil ;; package is bundled with emacs
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
(setq echo-keystrokes 0.1)

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

;; show human readable sizes in dired
(setq dired-listing-switches "-alh")

;; group directories first in dired if supported
(when (eq 0 (call-process insert-directory-program
                          nil nil nil "--group-directories-first"))
  (setq dired-listing-switches (concat dired-listing-switches
                                       " --group-directories-first")))

;; single space ends a sentence
(setq-default sentence-end-double-space nil)

;; default to 80 chars fill-column
(setq-default fill-column 80)

;; confirm when exiting
(setq confirm-kill-emacs 'y-or-n-p)

;; disable backup files
(setq make-backup-files nil)

;; preserve point position when scrolling
(setq scroll-preserve-screen-position 'always)

;; always add newline at the end of the file
(setq require-final-newline t)

;; remember position in previously visited files
(use-package saveplace
  :ensure nil ;; package is bundled with emacs
  :config
  (save-place-mode 1))

(provide 'init-sane-defaults)
