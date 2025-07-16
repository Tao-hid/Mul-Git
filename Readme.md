# 🧠 Working with Multiple GitHub Accounts Using Access Tokens & PyCharm

Managing multiple GitHub accounts within a single repository can be tricky—especially when dealing with multiple access tokens. Fortunately, **PyCharm** makes handling multiple GitHub tokens much easier.

---

## 🚀 Steps to Add Multiple GitHub Accounts in PyCharm

1. Open **PyCharm**.
2. Navigate to:  
   `File` → `Settings` → `Version Control` → `GitHub`
3. Click the ➕ (plus) icon and you'll see 3 login options:
   - **Login via GitHub**
   - **Login with Token**
   - **Login to GitHub Enterprise**
4. Choose **Login with Token** and provide the access token for the corresponding user.
5. You can also **set a default GitHub user** here.

---

## 🔄 Switching GitHub Accounts via Command Line

If you want to switch between GitHub accounts manually, you can run:

```bash
git config user.name "targetUsername"
git config user.email "targetEmail"
```


## ⚙️ Use a Shell Script for Easier Switching

Instead of remembering and typing the config every time, use this script:

```bash
#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <profile>"
    exit 1
fi

# Assign argument to variable
PROFILE="$1"

# Set Git config based on the profile
if [ "$PROFILE" == "User1" ]; then
    git config --local user.name "User1Name"
    git config --local user.email "User1Email"
elif [ "$PROFILE" == "User2" ]; then
    git config --local user.name "User2Name"
    git config --local user.email "User2Email"
elif [ "$PROFILE" == "User3" ]; then
    git config --local user.name "User3Name"
    git config --local user.email "User3Email"
else
    echo "❌ Unknown profile: $PROFILE"
    exit 1
fi

echo "✅ Git config updated successfully:"
git config --get user.name
git config --get user.email
```

## 🛠️ How to Use the Script

```bash
bash switch-git-profile.sh "User1"
```
Replace "User1" with the profile name you defined in the script (User1, User2, or User3).

## 📝 Optional: Keep the Script in Your Repo But Untracked

To make the script available in your repo but avoid committing it:

1. Place the script in the root of your repo:

    ```bash
    touch switch-git-profile.sh
    chmod +x switch-git-profile.sh
    ```

2. Add it to `.git/info/exclude` to ignore it locally:

    ```bash
    switch-git-profile.sh
    ```

This way, the file is kept across branches but never committed to Git.
