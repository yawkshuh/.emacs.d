(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" default))
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages '(ido-completing-read+ zenburn-theme gruvbox-theme))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monoid" :foundry "PfEd" :slant normal :weight normal :height 98 :width semi-condensed)))))

(setq make-backup-files nil)
(setq auto-save-default nil)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(set-fringe-mode 0)

(setq inhibit-startup-screen t)
(setq visible-bell 1)
(setq ring-bell-function 'ignore) 

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; (load-theme 'gruvbox)
(load-theme 'zenburn)

(ido-mode 1)
(ido-everywhere 1)
(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)


;;(set-frame-parameter (selected-frame) 'alpha '(90 . 75))
;;(add-to-list 'default-frame-alist '(alpha . (90 . 75)))

(setq-default tab-width 4)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
