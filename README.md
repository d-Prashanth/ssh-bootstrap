# 🔐 SSH Bootstrap Tool

## 📌 Overview

This tool automates SSH key injection into multiple servers using password-based authentication.

It is mainly used as a **bootstrap step** before running automation tools like Ansible.

---

## ⚙️ How It Works

* Reads list of servers from `hosts.txt`
* Reads corresponding passwords from `passwords.txt`
* Uses `sshpass` + `ssh-copy-id`
* Injects SSH public key into each server

---

## 📂 Project Structure

```
ssh-bootstrap/
├── ssh_inject.sh
├── hosts.txt
├── passwords.txt
└── .ssh/
    └── sshAllow   (your SSH public key)
```

---

## 🧰 Requirements

* Linux environment
* `sshpass` installed

Install:

```
apt install sshpass -y
```

---

## 🚀 Usage

### 1. Add Hosts

Edit `hosts.txt`:

```
192.168.1.10
192.168.1.11
```

---

### 2. Add Passwords

Edit `passwords.txt`:

```
password1
password2
```

> ⚠️ Order must match hosts

---

### 3. Add SSH Key

Place your **public key** here:

```
.ssh/sshAllow
```

---

### 4. Run Script

```
chmod +x ssh_inject.sh
./ssh_inject.sh
```

---

## ✅ Output

```
Processing 192.168.1.10...
Key copied to 192.168.1.10

Processing 192.168.1.11...
Key copied to 192.168.1.11
```

---

## 🔐 Security Notes

* Do NOT commit:

  * `hosts.txt`
  * `passwords.txt`
  * private SSH keys

* Only use password authentication for initial setup

---

## 🎯 Use Case

* Prepare servers for Ansible
* Enable passwordless SSH
* Bootstrap infrastructure nodes

---

## 👨‍💻 Author

Prashanth D
Linux Instructor(Freelance)
