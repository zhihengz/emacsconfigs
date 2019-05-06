(local/ensure-package-loaded 'solarized-theme)
(require 'solarized-theme)
(if window-system
    (load-theme 'solarized-light t)
  (load-theme 'wombat t))
