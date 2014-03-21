;; set font
(set-face-attribute 'default nil :family "Source Code Pro")
(set-face-attribute 'default nil :height 140)

;; configure modifiers
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

;; Norwegian mac-keyboard
(define-key key-translation-map (kbd "s-8") (kbd "["))
(define-key key-translation-map (kbd "s-(") (kbd "{"))
(define-key key-translation-map (kbd "s-9") (kbd "]"))
(define-key key-translation-map (kbd "s-)") (kbd "}"))
(define-key key-translation-map (kbd "s-7") (kbd "|"))
(define-key key-translation-map (kbd "s-/") (kbd "\\"))
(define-key key-translation-map (kbd "M-s-7") (kbd "M-|"))

;; don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

;; move deleted files to ~/.Trash
(setq trash-directory "~/.Trash")

;; use path from shell
(require-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(provide 'init-mac)
