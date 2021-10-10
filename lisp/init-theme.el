;;; init-theme.el --- configure theme  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/theme-light 'doom-one-light
  "The light theme to use when toggling themes with `mpolden/toggle-theme'.")

(defvar mpolden/theme-dark 'doom-one
  "The dark theme to use when toggling themes with `mpolden/toggle-theme'.")

(defun mpolden/switch-theme (&optional theme)
  "Disable any currently enabled themes and load THEME."
  (interactive "P")
  (mapcar #'disable-theme custom-enabled-themes)
  (let ((custom-safe-themes t))
    (if theme
        (load-theme theme)
      (call-interactively 'load-theme))))

(defun mpolden/toggle-theme ()
  "Toggle between dark and light themes.
The variables `mpolden/theme-light' and `mpolden/theme-dark'
decides the themes to toggle between."
  (interactive)
  (let ((is-light (memq mpolden/theme-light custom-enabled-themes) )
        (is-dark (memq mpolden/theme-dark custom-enabled-themes)))
    (cond
     (is-light (mpolden/switch-theme mpolden/theme-dark))
     (is-dark (mpolden/switch-theme mpolden/theme-light))
     (t (message "Don't know how to toggle theme: %s" (car custom-enabled-themes))))))

(use-package doom-themes
  :ensure t
  :defer nil
  :if (display-graphic-p)
  :bind ("C-c T" . mpolden/toggle-theme)
  :config
  (load-theme mpolden/theme-dark t))

(provide 'init-theme)

;;; init-theme.el ends here
