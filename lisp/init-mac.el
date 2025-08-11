;;; init-mac.el --- configuration specific to macos  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defcustom mpolden/path-from-shell "/opt/homebrew/bin/fish"
  "The shell to use when determining the PATH."
  :type 'file)

;; use command as meta
(setopt mac-command-modifier 'meta)

;; let macos handle alternate characters
(setopt mac-option-modifier 'none)

(when (featurep 'mac)
  ;; disable native tabs
  (setopt mac-frame-tabbing nil)
  ;; remove default mappings for tab bar
  (global-unset-key (kbd "C-<tab>"))
  (global-unset-key (kbd "C-S-<tab>")))

;; don't open files from the workspace in a new frame
(setopt ns-pop-up-frames nil)

;; use old-style fullscreen
(setopt ns-use-native-fullscreen nil)

;; move deleted files to ~/.Trash
(setopt trash-directory "~/.Trash")

;; use paths from shell
(use-package exec-path-from-shell
  :ensure t
  :init
  (setopt exec-path-from-shell-variables '("PATH" "MANPATH" "GOPATH"
                                           "JAVA_HOME" "SSH_AUTH_SOCK"))
  (when (file-executable-p mpolden/path-from-shell)
    (setopt exec-path-from-shell-shell-name mpolden/path-from-shell))
  :config
  (exec-path-from-shell-initialize))

;; use gls if available (which supports --dired option)
(when (executable-find "gls")
  (setopt insert-directory-program "gls"))

(provide 'init-mac)

;;; init-mac.el ends here
