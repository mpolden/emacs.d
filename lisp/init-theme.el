;;; init-theme.el --- configure theme  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/theme-light 'doom-one-light
  "The light theme to use when toggling themes with `mpolden/toggle-theme'.")

(defvar mpolden/theme-dark 'doom-one
  "The dark theme to use when toggling themes with `mpolden/toggle-theme'.")

(defun mpolden/switch-theme (&optional theme)
  "Disable any currently enabled themes and load THEME."
  (interactive)
  (if (and (not theme) (functionp 'consult-theme))
      (call-interactively 'consult-theme)
    (let ((custom-safe-themes t))
      (mapcar #'disable-theme custom-enabled-themes)
      (if theme
          (load-theme theme)
        (call-interactively 'load-theme)))))

(defun mpolden/current-theme ()
  "Return current theme, which is either 'light or 'dark."
  (cond
   ((memq mpolden/theme-light custom-enabled-themes) 'light)
   ((memq mpolden/theme-dark custom-enabled-themes) 'dark)
   (t (error "Failed to detect current theme. Enabled themes: %s"
             custom-enabled-themes))))

(defun mpolden/toggle-theme ()
  "Toggle between dark and light themes.

The variables `mpolden/theme-light' and `mpolden/theme-dark'
decides the themes to toggle between.

A prefix argument prompts for a theme to load instead of toggling
the current theme."
  (interactive)
  (if current-prefix-arg
      (mpolden/switch-theme)
    (let* ((is-light (eq (mpolden/current-theme) 'light))
           (new-theme (if is-light mpolden/theme-dark mpolden/theme-light)))
      (mpolden/switch-theme new-theme))))

(use-package doom-themes
  :ensure t
  :defer nil
  :if (display-graphic-p)
  :bind ("C-c t" . mpolden/toggle-theme)
  :config
  (load-theme mpolden/theme-dark t))

(provide 'init-theme)

;;; init-theme.el ends here
