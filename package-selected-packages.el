;;; package --- installed packages
;;; Commentary:
;;; Code:

;; Adding MELPA
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (alchemist elixir-mode flycheck-credo theme-looper zenburn-theme web-mode smooth-scrolling smart-comment shift-text racer neotree minibuffer-complete-cycle json-mode js2-mode github-theme foggy-night-theme flycheck-pyflakes flycheck-elixir flatui-theme flatland-theme flatland-black-theme django-theme distinguished-theme display-theme darktooth-theme darkokai-theme darkane-theme dakrone-theme cyberpunk-theme company-racer company-quickhelp color-theme-sanityinc-solarized colonoscopy-theme clues-theme cl-lib-highlight caroline-theme badwolf-theme atom-one-dark-theme arjen-grey-theme ample-zen-theme ample-theme afternoon-theme))))

;;; package-selected-packages.el ends here
