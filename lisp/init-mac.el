;;; init-mac.el --- configuration specific to macos  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/font-family "Iosevka" "Set the default font.")

(defvar mpolden/font-size 14 "Set the default font size in points.")

;; set font
(let ((font-family mpolden/font-family))
  (when (and (display-graphic-p) (member font-family (font-family-list)))
    (set-face-attribute 'default nil
                        :family font-family
                        :height (* 10 mpolden/font-size))))


;; use command as meta
(setq mac-command-modifier 'meta)

;; disable native tabs
(setq mac-frame-tabbing nil)

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
                                               "JAVA_HOME" "SSH_AUTH_SOCK"))
  :config (exec-path-from-shell-initialize))

;; add binding for toggling fullscreen
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)

;; use gls if available (which supports --dired option)
(when (executable-find "gls")
  (setq insert-directory-program "gls"))

(provide 'init-mac)

;;; init-mac.el ends here
