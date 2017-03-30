;;; package --- aesthetical things
;;; Commentary:
;;; Code:

;; switch between available themes
(require 'theme-looper )
(global-set-key (kbd "C-t") 'theme-looper-enable-next-theme)
(global-set-key (kbd "C-<") 'theme-looper-enable-random-theme)

;; at start pick a random theme
(theme-looper-enable-random-theme)

;; show current themes name
(global-display-theme-mode 1)

;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

;; Show column number
(setq column-number-mode t)

;;; look.el ends here
