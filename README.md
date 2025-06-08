# `oops-i-did-it-again-setup`

---

## 🤷‍♀️ About This Repository

So, you *accidentally* formatted your Linux partition again, huh? Don't worry, it happens to the best of us. This repo is your personal "oh-crap-I-need-my-dev-environment-back-NOW" button.

It's a one-stop shop containing a simple Bash script designed to set up a fresh Ubuntu/Debian-based Linux machine with all the essentials for a data engineer who loves Python, Docker, Terraform, and SQL. Think of it as a digital CPR kit for your development setup.

---

## 🛠️ What it Installs

This script will magically bring back your usual suspects:

* **System Updates & Core Utilities:** `wget`, `curl`, `snapd`, `net-tools`, `iproute2`, `nmap`.
* **Browse & Entertainment:** Google Chrome, Spotify.
* **Development Powerhouses:**
    * **VS Code** (with essential extensions like Copilot, Terraform, Docker, Python, Pylance, Todo Tree, Rainbow CSV, Live Share).
    * **Docker** & **Docker Compose** (because containers make everything better).
    * **Python 3** (and yes, it *will* remove `pip` because we believe in strict virtual environments).
    * **Poetry** (your new best friend for Python dependency management and virtual environments, configured to keep things in-project).
    * **Git**.
    * **Postman** (for API testing).
    * **TablePlus** (your new favorite SQL client, no more DBeaver headaches!).
* **Utilities & Network:** `htop`, Transmission, WireGuard.
* **Handy Aliases:** `vsc` to quickly open VS Code in the current directory.

---

## 🚀 How to Use It

1.  **Clone this repo** (if you still have `git` working, otherwise, download the ZIP):
    ```bash
    git clone [https://github.com/piopy/oops-i-did-it-again-setup.git](https://github.com/piopy/oops-i-did-it-again-setup.git)
    cd oops-i-did-it-again-setup
    ```
2.  **Make the script executable:**
    ```bash
    chmod +x setup.sh
    ```
3.  **Run the script:**
    ```bash
    ./setup.sh
    ```
4.  **Grab a coffee** (or something stronger). This might take a bit.
5.  **Reboot your machine** after the script finishes for all changes (especially Docker group membership) to take full effect.
6.  **Enjoy your restored sanity!**

---

## ⚠️ Important Notes (Read Before You Panic)

* **No `pip` for you!** This script explicitly removes the global `python3-pip`. Seriously. You're *strongly* encouraged to use **Poetry** for all your Python project dependencies. Learn it, love it, live it.
* **Assumes Ubuntu/Debian:** This script is tailored for Debian-based distributions. Your mileage may vary on others.
* **Root Privileges:** The script will ask for your `sudo` password multiple times. That's normal, it's installing a lot of stuff.
* **Reboot is Key:** Don't forget to reboot after running the script, or some things (like Docker permissions) might not work immediately.

---

## 🔮 Future Enhancements

* (Maybe) Add options for specific distributions.
* (Probably not) Add more ways to break your system.

---

Feel free to contribute if you find a more "efficient" way to format your drive! 😉

---