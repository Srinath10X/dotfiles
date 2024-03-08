import json
import subprocess


def check_installed(package):
    result = subprocess.run(['yay', '-Qq', package], stdout=subprocess.PIPE)
    return result.returncode == 0


def install_packages(packages):
    subprocess.run(['yay', '-Sy', '--noconfirm'] + packages)


def main():
    config_file = '/home/srinath/.config/confix/configuration.json'
    try:
        with open(config_file) as f:
            config = json.load(f)
        if 'packages' in config:
            packages = config['packages']
            missing_packages = [
                pkg for pkg in packages if not check_installed(pkg)]
            if missing_packages:
                install_packages(missing_packages)
                print("Packages installed successfully.")
            else:
                print("Packages are already installed.")
        else:
            print("Error: 'packages' key not found in the configuration.")
    except FileNotFoundError:
        print(f"Error: Configuration file '{config_file}' not found.")
    except json.JSONDecodeError:
        print(f"Error: Failed to decode JSON in '{config_file}'.")


if __name__ == "__main__":
    main()
