;;; init-mac.el --- configuration specific to macos  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;; use command as meta
(setq mac-command-modifier 'meta)

;; keyboard configuration when not using mac port
(unless (featurep 'mac)
  ;; configure modifiers
  (setq mac-option-modifier 'super)
  (setq ns-function-modifier 'hyper)

  ;; Norwegian mac-keyboard
  (define-key key-translation-map (kbd "s-8") (kbd "["))
  (define-key key-translation-map (kbd "s-(") (kbd "{"))
  (define-key key-translation-map (kbd "s-9") (kbd "]"))
  (define-key key-translation-map (kbd "s-)") (kbd "}"))
  (define-key key-translation-map (kbd "s-7") (kbd "|"))
  (define-key key-translation-map (kbd "s-/") (kbd "\\"))
  (define-key key-translation-map (kbd "M-s-7") (kbd "M-|")))

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
