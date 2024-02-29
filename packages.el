;; Copyright 2024 haghir
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;; async
(use-package async :ensure t :config (dired-async-mode 1))

;; Bison Mode
(use-package bison-mode :ensure t
  :mode (
    "\\.y\\'"
    "\\.l\\'")
  :config
    (setq imenu-create-index-function
      (lambda ()
        (let ((end))
          (beginning-of-buffer)
          (re-search-forward "^%%")
          (forward-line 1)
          (setq end (save-excursion (re-search-forward "^%%") (point)))
          (loop while (re-search-forward "^\\([a-z].*?\\)\\s-*\n?\\s-*:" end t)
            collect (cons (match-string 1) (point))))))
  :hook
    (bison-mode . (lambda ()
      (setq indent-tabs-mode t)
      (setq bison-basic-offset 8)
      (setq tab-width 8))))

;; C Mode
(use-package c-mode
  :mode (
    "\\.c\\'"
    "\\.tc\\'"
    "\\.sdr\\'")
  :hook
    (c-mode .(lambda ()
      (setq indent-tabs-mode t)
      (setq tab-width 8)
      (setq c-basic-offset 8))))

;; CSharp Mode
(use-package csharp-mode :ensure t
  :mode
    "\\.cs\\'"
  :hook
    (csharp-mode . (lambda ()
      (setq indent-tabs-mode nil)
      (setq tab-width 4)
      (setq c-basic-offset 4))))

;; gtags (requires GNU Global)
(use-package gtags-mode :ensure t)

;; helm
(use-package helm :ensure t :config (helm-mode 1))

;; JS2 Mode
(use-package js2-mode :ensure t
  :mode (
    "\\.js\\'"
    "\\.jsx\\'"
    "\\.json\\'"
    "\\.cfc\\'")
  :hook
    (js2-mode . (lambda ()
      (setq indent-tabs-mode nil)
      (setq js2-basic-offset 4)
      (setq tab-width 4))))

;; Lisp Mode
(use-package lisp-mode :config (setq indent-tabs-mode nil))

;; Markdown Mode
(use-package markdown-mode :ensure t
  :mode (
    ("\\.markdown\\'" . gfm-mode)
    ("\\.md\\'" . gfm-mode)
    ("README\\.md\\'" . gfm-mode))
  :hook (
    (gfm-mode . (lambda ()
      (setq indent-tabs-mode nil)
      (setq tab-width 2)
      (setq markdown-list-indent-width 2)
      (setq indent-line-function 'insert-tab)))
    (markdown-mode . (lambda ()
      (setq indent-tabs-mode nil)
      (setq tab-width 2)
      (setq markdown-list-indent-width 2)
      (setq indent-line-function 'insert-tab)))))

;; mozc
;;(add-to-list 'load-path (locate-user-emacs-file "repos/mozc"))
;;(setq default-input-method "japanese-mozc")
;;(require 'mozc)

;; pcre2el
(use-package pcre2el :ensure t)

;; Perl Mode
(use-package perl-mode
  :mode (
    "\\.pl\\'"
    "\\.yp\\'")
  :hook
    (perl-mode . (lambda ()
      (setq indent-tabs-mode t)
      (setq tab-width 4)
      (setq cperl-indent-level 4))))

;; Python Mode
(use-package python-mode
  :mode 
    "\\.py\\'"
  :interpreter
    ("python" "python3")
  :hook
    (python-mode . (lambda ()
      (setq indent-tabs-mode nil)
      (setq tab-width 4)
      (setq python-indent-offset 4))))

;; Rust Mode
(use-package rust-mode :ensure t
  :mode
    "\\.rs\\'"
  :hook
    (rust-mode . (lambda ()
      (setq indent-tabs-mode nil)
      (setq tab-width 4)
      (setq rust-indent-offset 4))))

;; Scala Mode
(use-package scala-mode :ensure t :mode "\\.scala\\'")

;; Shell script
(setq sh-basic-offset 8)
(setq sh-indentation 8)

;; SQL
(use-package sql
  :hook
    (sql-mode . (lambda ()
      (setq indent-tabs-mode nil)
      (setq tab-width 4)
      (setq sql-indent-offset 4))))

;; Text Mode
(use-package text-mode
  :hook
    (text-mode . (lambda ()
      (setq indent-tabs-mode nil)
      (setq tab-width 3))))

;; TypeScript Mode
(use-package typescript-mode :ensure t
  :mode (
    "\\.ts\\'"
    "\\.tsx\\'")
  :hook
    (typescript-mode . (lambda ()
      (setq indent-tabs-mode nil)
      (setq typescript-indent-level 4)
      (setq tab-width 4))))

;; Web Mode
(use-package web-mode :ensure t
  :mode (
    "\\.phtml\\'"
    "\\.tpl\\'"
    "\\.[agj]sp\\'"
    "\\.as[cp]x\\'"
    "\\.erb\\'"
    "\\.mustache\\'"
    "\\.djhtml\\'"
    "\\.html?\\'"
    "\\.css\\'"
    "\\.cfm\\'"
    "\\.php\\'")
  :hook
    (web-mode . (lambda ()
      (setq indent-tabs-mode nil)
      (setq web-mode-markup-indent-offset 2)
      (setq web-mode-css-indent-offset 2)
      (setq web-mode-code-indent-offset 2)
      (setq tab-width 2))))

;; yaml
(use-package yaml-mode :ensure t
  :mode (
    "\\.yml\\'"
    "\\.yaml\\'")
  :hook
    (yaml-mode . (lambda ()
      (setq indent-tabs-mode nil)
      (setq tab-width 2))))

;; yasnippet
(use-package yasnippet :ensure t
  :config (lambda ()
    (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets"))
    (yas-global-mode 1)))
