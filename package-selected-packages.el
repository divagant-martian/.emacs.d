;;; package --- installed packages
;;; Commentary:
;;; Code:

;; Adding MELPA
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; refreshes contents and installs everything
(defun install-everything()
  (interactive)
  (package-refresh-contents)
  (package-install-selected-packages))


(defun recompile-everything()
  (interactive)
  (byte-recompile-directory (expand-file-name "~/.emacs.d") 0))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (scala-mode string-inflection multiple-cursors hungry-delete alchemist elixir-mode flycheck-credo theme-looper zenburn-theme web-mode smooth-scrolling smart-comment shift-text racer neotree minibuffer-complete-cycle json-mode js2-mode github-theme flycheck-pyflakes flycheck-elixir flatui-theme flatland-theme flatland-black-theme django-theme distinguished-theme display-theme darktooth-theme darkokai-theme darkane-theme dakrone-theme cyberpunk-theme company-racer company-quickhelp color-theme-sanityinc-solarized colonoscopy-theme clues-theme cl-lib-highlight caroline-theme badwolf-theme atom-one-dark-theme arjen-grey-theme ample-theme afternoon-theme))))

;;; package-selected-packages.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
