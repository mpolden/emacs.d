;; use source code pro font if available
;; https://github.com/adobe-fonts/source-code-pro
(let ((font-family "Source Code Pro"))
  (when (and (display-graphic-p) (member font-family (font-family-list)))
    (set-face-attribute 'default nil :family font-family)
    (set-face-attribute 'default nil :height 140)))

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

;; use old-style fullscreen
(setq ns-use-native-fullscreen nil)

;; move deleted files to ~/.Trash
(setq trash-directory "~/.Trash")

;; use path from shell
(require-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; add binding for toggling fullscreen
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)

;; use gls if available (which supports --dired option)
(when (executable-find "gls")
  (setq insert-directory-program "gls"))

(provide 'init-mac)
