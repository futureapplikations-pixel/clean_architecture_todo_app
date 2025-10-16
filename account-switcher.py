#!/usr/bin/env python3
"""
Google Gemini API Account Switcher
Automatically switches between different Google API accounts for Gemini API access.
"""

import os
import json
import sys
import argparse
from pathlib import Path

class GeminiAccountSwitcher:
    def __init__(self, config_file="gemini_accounts.json"):
        self.config_file = Path.home() / config_file
        self.env_file = Path.cwd() / ".env"
        self.accounts = {}
        self.current_account = None
        self.load_accounts()

    def load_accounts(self):
        """Load accounts from configuration file."""
        if self.config_file.exists():
            try:
                with open(self.config_file, 'r') as f:
                    data = json.load(f)
                    self.accounts = data.get('accounts', {})
                    self.current_account = data.get('current_account')
            except (json.JSONDecodeError, KeyError):
                print("Warning: Could not load accounts configuration.")
                self.accounts = {}

    def save_accounts(self):
        """Save accounts to configuration file."""
        data = {
            'accounts': self.accounts,
            'current_account': self.current_account
        }
        with open(self.config_file, 'w') as f:
            json.dump(data, f, indent=2)

    def add_account(self, name, api_key, description=""):
        """Add a new account."""
        self.accounts[name] = {
            'api_key': api_key,
            'description': description
        }
        print(f"Added account: {name}")
        self.save_accounts()

    def list_accounts(self):
        """List all available accounts."""
        if not self.accounts:
            print("No accounts configured.")
            return

        print("\nAvailable accounts:")
        print("-" * 50)
        for name, info in self.accounts.items():
            current = " (current)" if name == self.current_account else ""
            print(f"{name}{current}")
            if info.get('description'):
                print(f"  Description: {info['description']}")
            print(f"  API Key: {info['api_key'][:20]}...")
            print()

    def switch_account(self, name):
        """Switch to a specific account."""
        if name not in self.accounts:
            print(f"Error: Account '{name}' not found.")
            return False

        self.current_account = name
        self.save_accounts()

        # Set environment variable for the current session
        api_key = self.accounts[name]['api_key']
        os.environ['GEMINI_API_KEY'] = api_key

        # Write to .env file for persistence
        self.write_env_file(api_key)

        print(f"Switched to account: {name}")
        print(f"API key written to .env file for persistence")
        return True

    def get_current_account(self):
        """Get information about the current account."""
        if not self.current_account or self.current_account not in self.accounts:
            print("No account currently selected.")
            return None

        account_info = self.accounts[self.current_account]
        print(f"Current account: {self.current_account}")
        if account_info.get('description'):
            print(f"Description: {account_info['description']}")
        print(f"API Key: {account_info['api_key'][:20]}...")
        return self.current_account

    def remove_account(self, name):
        """Remove an account."""
        if name not in self.accounts:
            print(f"Error: Account '{name}' not found.")
            return False

        if name == self.current_account:
            self.current_account = None

        del self.accounts[name]
        print(f"Removed account: {name}")
        self.save_accounts()
        return True

    def auto_switch(self):
        """Automatically switch to the next available account."""
        if not self.accounts:
            print("Error: No accounts configured.")
            return False

        # Get list of account names sorted alphabetically
        account_names = sorted(self.accounts.keys())

        if not self.current_account:
            # If no current account, switch to the first one
            next_account = account_names[0]
        else:
            # Find current account index and get next one
            try:
                current_index = account_names.index(self.current_account)
                next_index = (current_index + 1) % len(account_names)
                next_account = account_names[next_index]
            except ValueError:
                # Current account not found in list, switch to first
                next_account = account_names[0]

        # Switch to the next account
        return self.switch_account(next_account)

    def get_next_account_name(self):
        """Get the name of the next account that would be switched to."""
        if not self.accounts:
            return None

        account_names = sorted(self.accounts.keys())

        if not self.current_account:
            return account_names[0]
        else:
            try:
                current_index = account_names.index(self.current_account)
                next_index = (current_index + 1) % len(account_names)
                return account_names[next_index]
            except ValueError:
                return account_names[0]

    def show_config_location(self):
        """Show the location of the configuration file."""
        print(f"Configuration file location: {self.config_file}")
        print(f"File exists: {self.config_file.exists()}")

        if self.config_file.exists():
            try:
                file_size = self.config_file.stat().st_size
                print(f"File size: {file_size} bytes")
            except OSError:
                pass

    def write_env_file(self, api_key):
        """Write GEMINI_API_KEY to .env file."""
        try:
            # Read existing .env file if it exists
            existing_content = ""
            if self.env_file.exists():
                with open(self.env_file, 'r') as f:
                    existing_content = f.read()

            # Check if GEMINI_API_KEY already exists in the file
            lines = existing_content.split('\n')
            gemini_key_exists = False
            other_lines = []

            for line in lines:
                if line.strip().startswith('GEMINI_API_KEY='):
                    gemini_key_exists = True
                    other_lines.append(f'GEMINI_API_KEY={api_key}')
                elif line.strip():  # Keep non-empty lines
                    other_lines.append(line)

            if not gemini_key_exists:
                other_lines.append(f'GEMINI_API_KEY={api_key}')

            # Write back to .env file
            with open(self.env_file, 'w') as f:
                f.write('\n'.join(other_lines))

            print(f"Updated .env file: {self.env_file}")
            return True

        except Exception as e:
            print(f"Warning: Could not write to .env file: {e}")
            return False

    def check_gemini_api_key(self):
        """Check if GEMINI_API_KEY is available in environment or .env file."""
        # First check environment variable
        if 'GEMINI_API_KEY' in os.environ:
            return True

        # Then check .env file
        if self.env_file.exists():
            try:
                with open(self.env_file, 'r') as f:
                    for line in f:
                        if line.strip().startswith('GEMINI_API_KEY=') and len(line.strip()) > len('GEMINI_API_KEY='):
                            return True
            except Exception:
                pass

        return False

    def load_env_file(self):
        """Load environment variables from .env file if it exists."""
        if self.env_file.exists():
            try:
                with open(self.env_file, 'r') as f:
                    for line in f:
                        line = line.strip()
                        if line and not line.startswith('#') and '=' in line:
                            key, value = line.split('=', 1)
                            os.environ[key] = value
            except Exception as e:
                print(f"Warning: Could not load .env file: {e}")

    def show_status(self):
        """Show status of API key availability and .env file."""
        print("\n=== Gemini API Key Status ===")

        # Check if API key is available in environment
        env_has_key = 'GEMINI_API_KEY' in os.environ
        env_file_has_key = False

        if self.env_file.exists():
            try:
                with open(self.env_file, 'r') as f:
                    for line in f:
                        if line.strip().startswith('GEMINI_API_KEY=') and len(line.strip()) > len('GEMINI_API_KEY='):
                            env_file_has_key = True
                            break
            except Exception:
                pass

        # Show environment variable status
        if env_has_key:
            print("✓ GEMINI_API_KEY environment variable: SET")
        else:
            print("✗ GEMINI_API_KEY environment variable: NOT SET")

        # Show .env file status
        if self.env_file.exists():
            print(f"✓ .env file exists: {self.env_file}")
            if env_file_has_key:
                print("✓ .env file contains GEMINI_API_KEY")
            else:
                print("✗ .env file does not contain GEMINI_API_KEY")
        else:
            print(f"✗ .env file does not exist: {self.env_file}")

        # Show accounts status
        print(f"\n=== Accounts Status ===")
        if self.accounts:
            print(f"✓ Total accounts configured: {len(self.accounts)}")
            if self.current_account and self.current_account in self.accounts:
                print(f"✓ Current account: {self.current_account}")
            else:
                print("✗ No current account selected")
        else:
            print("✗ No accounts configured")
            print("\nTo get started:")
            print("1. Add an account: python account-switcher.py add <name> <api_key>")
            print("2. Switch to the account: python account-switcher.py switch <name>")
            print("3. The API key will be automatically written to .env file")

        # Show recommendations
        if not env_has_key and not env_file_has_key:
            print("\n=== Recommendation ===")
            print("GEMINI_API_KEY environment variable not found.")
            print("Add that to your environment and try again (no reload needed if using .env)!")

        print()

def main():
    parser = argparse.ArgumentParser(description="Google Gemini API Account Switcher")
    subparsers = parser.add_subparsers(dest='command', help='Available commands')

    # Add account command
    add_parser = subparsers.add_parser('add', help='Add a new account')
    add_parser.add_argument('name', help='Account name')
    add_parser.add_argument('api_key', help='API key')
    add_parser.add_argument('description', nargs='?', default='', help='Account description')

    # List accounts command
    subparsers.add_parser('list', help='List all accounts')

    # Switch account command
    switch_parser = subparsers.add_parser('switch', help='Switch to an account')
    switch_parser.add_argument('name', help='Account name to switch to')

    # Current account command
    subparsers.add_parser('current', help='Show current account')

    # Remove account command
    remove_parser = subparsers.add_parser('remove', help='Remove an account')
    remove_parser.add_argument('name', help='Account name to remove')

    # Auto switch command
    subparsers.add_parser('auto', help='Automatically switch to the next account')

    # Next account command
    subparsers.add_parser('next', help='Show the next account that would be switched to')

    # Config location command
    subparsers.add_parser('config', help='Show configuration file location')

    # Status command
    subparsers.add_parser('status', help='Show status of API key and .env file')

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return

    # Load .env file first
    switcher = GeminiAccountSwitcher()
    switcher.load_env_file()

    if args.command == 'add':
        switcher.add_account(args.name, args.api_key, args.description or "")
    elif args.command == 'list':
        switcher.list_accounts()
    elif args.command == 'switch':
        switcher.switch_account(args.name)
    elif args.command == 'current':
        switcher.get_current_account()
    elif args.command == 'remove':
        switcher.remove_account(args.name)
    elif args.command == 'auto':
        switcher.auto_switch()
    elif args.command == 'next':
        next_account = switcher.get_next_account_name()
        if next_account:
            print(f"Next account would be: {next_account}")
        else:
            print("No accounts available")
    elif args.command == 'config':
        switcher.show_config_location()
    elif args.command == 'status':
        switcher.show_status()

if __name__ == "__main__":
    main()
