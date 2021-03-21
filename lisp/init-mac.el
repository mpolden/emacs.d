;;; init-mac.el --- configuration specific to macos  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/font-family "JetBrains Mono" "Set the default font.")

(defvar mpolden/font-size 14 "Set the default font size in points.")

;; set font
(let ((font-family mpolden/font-family))
  (when (and (display-graphic-p) (member font-family (font-family-list)))
    (set-face-attribute 'default nil :family font-family)
    (set-face-attribute 'default nil :height (* 10 mpolden/font-size))))

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

;; use paths from shell
(use-package exec-path-from-shell
  :ensure t
  :init (setq exec-path-from-shell-variables '("PATH" "MANPATH" "GOPATH"
                                               "JAVA_HOME" "CLASSPATH"))
  :config (exec-path-from-shell-initialize))

;; add binding for toggling fullscreen
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)

;; use gls if available (which supports --dired option)
(when (executable-find "gls")
  (setq insert-directory-program "gls"))

(provide 'init-mac)

;;; init-mac.el ends here
