;;; Setup --- Summary

;; Author: Nathanael Cho

;; Packages that should be installed:
;;   auctex, company, company-go, elpy, exec-path-from-shell,
;;   flycheck, go-mode, markdown-mode, markdown-preview-mode,
;;   shell-pop, use-package, yasnippet


;;; Commentary:

;; Until I get things more organized, all my Emacs configurations live here.


;;; Code:


;; Helper Functions

(defun empty-string-p (string)
  "Return true if STRING is empty or nil."
  (or (null string) (zerop (length string))))

(defun indent-buffer ()
  "Indent buffer according to major mode."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun set-python-environment (&optional version)
  "Make the Python environment use VERSION."
  (interactive)
  (unless version (setq version "python"))
  (setq elpy-rpc-python-command version)
  (setq python-shell-interpreter version))


;; Initial Setup

(setq inhibit-startup-message t)
(setq column-number-mode t)

(add-to-list 'exec-path "/usr/local/bin/")

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elpa")

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;; Get the user's PATH and GOPATH
(setq exec-path-from-shell-check-startup-files nil)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))


;; Personal Configuration (General)

;; Thin cursor
(setq-default cursor-type 'bar)

;; Spaces instead of tabs for indentation
(setq-default indent-tabs-mode nil)

;; Four spaces per tab in C
(setq-default c-default-style "linux" c-basic-offset 4)

;; Syntax highlighting for personal bash files
(add-to-list 'auto-mode-alist '("\\.bash_aliases\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.bash_helpers\\'" . shell-script-mode))


;; Package Configuration

;; AucTeX
(defun my-LaTeX-mode-hook ()
  "Personalize LaTeX environment."
  (setq preview-image-type 'pnm)
  (set (make-variable-buffer-local 'TeX-electric-math) (cons "$" "$")))
(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode-hook)

;; ElPy
(defun my-python-mode-hook()
  (elpy-enable)
  (company-mode)
  (if (not (empty-string-p (getenv "CONDA_PYTHON_EXE")))
      (set-python-environment (getenv "CONDA_PYTHON_EXE"))
    (set-python-environment "python")))
(add-hook 'python-mode-hook 'my-python-mode-hook)

;; ESS
(add-to-list 'load-path "/Users/Nacho/.emacs.personal/ess/lisp")
(load "ess-site")
(defun my-ess-mode-hook()
  (setq ess-blink-region nil)
  (ess-toggle-underscore nil)
  (global-set-key (kbd "C-;")  (lambda () (interactive) (insert " <- ")))
  (company-mode))
(add-hook 'ess-mode-hook 'my-ess-mode-hook)

;; FlyCheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Go
(defun my-go-mode-hook-company ()
  "Make company-mode work in go-mode."
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)
  (setq company-echo-delay 0)
  (setq company-idle-delay .3)
  (setq company-minimum-prefix-length 3)
  (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
  (define-key company-active-map [tab] 'company-complete-common-or-cycle))
(defun my-go-mode-hook-godef ()
  "Define godef jump key bindings."
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark))
(defun my-go-mode-hook-build ()
  "Customize compile command to run go build."
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet")))
(defun my-go-mode-hook ()
  "Customization for go-mode."
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (my-go-mode-hook-company)
  (my-go-mode-hook-godef)
  (my-go-mode-hook-build))
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; Ido-Mode
(require 'ido)
(ido-mode t)

;; Markdown
(add-to-list 'load-path "/Users/Nacho/.emacs.d/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; OCaml
(load "/Users/Nacho/.opam/system/share/emacs/site-lisp/tuareg-site-file")

;; Shell-Pop
(add-to-list 'load-path "~/.emacs.d/elpa/shell-pop-20170304.616/")
(require 'shell-pop)

;; Yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


;; Custom Variables/Faces

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(conda-anaconda-home "/Users/Nacho/.miniconda/3")
 '(electric-pair-mode t)
 '(electric-pair-text-pairs (quote ((34 . 34))))
 '(explicit-bash-args (quote ("--noediting" "--login" "-i")))
 '(ido-enable-flex-matching t)
 '(markdown-command "/usr/local/bin/pandoc")
 '(package-selected-packages
   (quote
    (yasnippet use-package shell-pop markdown-preview-mode markdown-mode go-mode flycheck exec-path-from-shell elpy company-go company auctex)))
 '(python-indent-guess-indent-offset nil)
 '(python-shell-completion-native-enable nil)
 '(shell-pop-full-span t)
 '(shell-pop-shell-type
   (quote
    ("shell" "*shell*"
     (lambda nil
       (term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/usr/local/bin/bash")
 '(shell-pop-universal-key "C-S-S")
 '(shell-pop-window-position "full")
 '(shell-pop-window-size 100))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; .emacs ends here
