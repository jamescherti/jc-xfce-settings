# jc-xfce-settings - JC's XFCE Settings
![License](https://img.shields.io/github/license/jamescherti/jc-xfce-settings)

This project provides the `jc-xfce-settings.sh` script, which holds James Cherti's settings to customize the XFCE desktop environment, including window management, notifications, desktop behavior, keyboard settings, and more, to enhance the user experience.

(The jc-xfce-settings.sh script was created with the help of [watch-xfce-xfconf](https://github.com/jamescherti/watch-xfce-xfconf))

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
## Table of Contents

- [jc-xfce-settings - JC's XFCE Settings](#jc-xfce-settings---jcs-xfce-settings)
  - [Requirements](#requirements)
  - [Usage](#usage)
  - [Features](#features)
  - [Author and License](#author-and-license)
  - [Links](#links)

<!-- markdown-toc end -->

## Requirements

- The XFCE Desktop Environment,
- and `xfconf-query` utility that is part of XFCE.

## Usage

1. Clone the repository:

   ```
   git clone https://github.com/jamescherti/jc-xfce-settings
   ```

2. Navigate to the repository directory:

   ```
   cd jc-xfce-settings
   ```

3. Run the script to configure XFCE:

   ```
   ./jc-xfce-settings.sh
   ```

## Features

- **Title Bar Customization:** Simplifies button layout for easier window management.
- **Font and Display Settings:** Enables anti-aliasing, hinting, and configures RGBA rendering.
- **File Manager (Thunar):** Optimizes behavior for thumbnailing, single-click navigation, and directory-specific settings.
- **Keyboard Tweaks:** Adjusts key repeat delay and rate for a smoother typing experience.
- **Notifications:** Sets notification theme, position, and timeout duration.
- **Desktop Behavior:** Disables unnecessary desktop icons and menus for a cleaner workspace.
- **Session Management:** Disables session saving for a faster logout experience.
- **Window Management:** Configures snapping, shadow effects, focus behavior, and workspace interactions.
- **Compositor Settings:** Adjusts transparency and disables unneeded effects.

## Author and License

The `jc-xfce-settings` tool has been written by [James Cherti](https://www.jamescherti.com/) and is distributed under terms of the MIT license.

## Links

- [jc-xfce-settings @GitHub](https://github.com/jamescherti/jc-xfce-settings)
- [watch-xfce-xfconf](https://github.com/jamescherti/watch-xfce-xfconf/): A command-line tool that can be used to configure XFCE 4 programmatically using the *xfconf-query* commands displayed when XFCE 4 settings are modified.

Other related project by the same author:
- [jc-dotfiles @GitHub](https://github.com/jamescherti/jc-dotfiles): A collection of UNIX/Linux configuration files. You can either install them directly or use them as inspiration your own dotfiles.
- [bash-stdops @GitHub](https://github.com/jamescherti/bash-stdops): A collection of Bash helper shell scripts.
- [jc-gnome-settings](https://github.com/jamescherti/jc-gnome-settings): GNOME customizations that can be applied programmatically.
- [jc-firefox-settings @GitHub](https://github.com/jamescherti/jc-firefox-settings): Provides the user.js file, which holds settings to customize the Firefox web browser to enhance the user experience and security.
- [jc-gentoo-portage @GitHub](https://github.com/jamescherti/jc-gentoo-portage): Provides configuration files for customizing Gentoo Linux Portage, including package management, USE flags, and system-wide settings.
