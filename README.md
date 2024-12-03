# jc-xfce-settings - JC's XFCE Settings

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

The `watch-xfce-xfconf` tool has been written by [James Cherti](https://www.jamescherti.com/) and is distributed under terms of the MIT license.

## Links

- [jc-xfce-settings @GitHub](https://github.com/jamescherti/jc-xfce-settings)

Other related project by the same author:
- [watch-xfce-xfconf @PyPI](https://pypi.org/project/watch-xfce-xfconf/): Configure XFCE 4 programmatically by displaying the xfconf-query commands that correspond to any change made in XFCE 4 / Xfconf settings.
