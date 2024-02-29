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

;; ============================================================================
;; Global Settings.
;; ============================================================================

;; Package
(package-initialize)
(setq package-archives
  '(("gnu" . "http://elpa.gnu.org/packages/")
    ("melpa" . "http://melpa.org/packages/")
    ("org" . "http://orgmode.org/elpa/")))

;; .emacs.d
(when load-file-name
  (setq user-emacs-directory
        (file-name-directory load-file-name)))

;; Encording.
(set-default-coding-systems 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; Global.
(setq global-hl-line-mode t)
(setq global-linum-mode t)
(setq line-number-mode t)
(setq column-number-mode t)
(setq-default indent-tabs-mode t)
(setq-default tab-width 8)

;; GUI
(when (display-graphic-p)
  ;; Theme
  (load-theme 'manoj-dark t)
  (set-face-background 'default "#1e1e1e")
  (set-face-foreground 'default "#dcdcdc"))

;; Whitespace.
(global-whitespace-mode t)
(set-face-background 'whitespace-tab nil)
(set-face-background 'whitespace-space nil)
(set-face-foreground 'whitespace-line nil)
(set-face-background 'whitespace-line nil)

;; Size.
(when window-system (set-frame-size (selected-frame) 80 25))

;; ============================================================================
;; Key bind
;; ============================================================================

;; General
(global-set-key (kbd "C-`") 'toggle-input-method)
(global-set-key (kbd "M-`") 'toggle-input-method)
(global-set-key (kbd "C-t") 'toggle-truncate-lines)
(global-set-key (kbd "C-M-!") 'eshell)

;; Window
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

;; ============================================================================
;; My commands
;; ============================================================================

;; Forms the development environment.
(defun devenv ()
  (interactive)
  (delete-other-windows)
  (let* (
      (w (/ (* (window-total-width) 1) 5))
      (h (/ (* (window-total-height) 3) 4)))
    (split-window-vertically)
    (enlarge-window (- h (window-total-height)))
    (split-window-horizontally)
    (shrink-window-horizontally (- (window-total-width) w))
    (dired ".")
    (other-window 2)
    (eshell)
    (other-window -1)))

;; Forms the shell environment.
(defun shellenv ()
  (interactive)
  (delete-other-windows)
  (let* (
      (h (/ (* (window-total-height) 3) 4)))
    (split-window-vertically)
    (enlarge-window (- h (window-total-height)))
    (other-window 1)
    (eshell)
    (other-window -1)))
