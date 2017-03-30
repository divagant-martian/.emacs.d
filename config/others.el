;;; package --- other configs
;;; Commentary:
;;; Code:

;; Cycle between autocompletion options
(require 'minibuffer-complete-cycle)
(setq minibuffer-complete-cycle 'auto)

;; aumentar el tamaño de la letra
(global-set-key (kbd "C-+") 'text-scale-increase )
(global-set-key (kbd "C--") 'text-scale-decrease )

;;; others.el ends here
