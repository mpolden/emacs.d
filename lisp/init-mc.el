(require-package 'multiple-cursors)

(require 'multiple-cursors)

(global-set-key (kbd "C-c m l") 'mc/edit-lines)
(global-set-key (kbd "C-c m b") 'mc/edit-beginnings-of-lines)

(provide 'init-mc)
