;;; init-mac.el --- configuration specific to macos  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;; use command as meta
(setq mac-command-modifier 'meta)

;; let macos handle alternate characters
(setq mac-option-modifier 'none)

;; disable native tabs
(setq mac-frame-tabbing nil)

;; remove default mappings for tab bar
(when (featurep 'mac)
  (global-unset-key (kbd "C-<tab>"))
  (global-unset-key (kbd "C-S-<tab>")))

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

;; use gls if available (which supports --dired option)
(when (executable-find "gls")
  (setq insert-directory-program "gls"))

(provide 'init-mac)

;;; init-mac.el ends here
