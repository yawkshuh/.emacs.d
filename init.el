(setq make-backup-files nil)
(setq auto-save-default nil)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(set-fringe-mode 0)

(setq inhibit-startup-screen t)
(setq visible-bell 1)
(setq ring-bell-function 'ignore) 

(setq-default tab-width 4)
(setq-default c-basic-offset 4)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'handmade t)

(split-window-horizontally)
(setq default-directory "~/")

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'joi-mode)
