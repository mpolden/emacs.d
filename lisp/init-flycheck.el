(use-package flycheck
  :init
  ;; disable noisy emacs-lisp checkers
  (setq-default flycheck-disabled-checkers '(emacs-lisp emacs-lisp-checkdoc))

  :config
  (global-flycheck-mode 1)
  ;; use both foodcritic and rubocop checkers for chef cookbooks
  (flycheck-add-next-checker 'chef-foodcritic 'ruby-rubocop))

(provide 'init-flycheck)
