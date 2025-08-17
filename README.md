# database-backup-recovery
 Demonstrating Database Backup and Recovery with scripts and documentation.

# CODTECH Internship - Task 4 :Database Backup and Recovery  

*COMPANY*: CODTECH IT SOLUTIONS

*NAME*: SIDDHI RAMESH VISHE

*INTERN ID*: CT06DZ106

*DOMAIN*: SQL

*DURATION*: 6 Weeks

*MENTOR* : NEELA SANTOSH 

This repository contains the implementation of **Task-4** of the **CODTECH Internship Program**.  
The task focuses on demonstrating **Database Backup and Recovery** — one of the most essential practices in database administration and disaster recovery planning.  

---

## 📌 Task Details  

### 🎯 Objective  
- Demonstrate how to **back up a database** and **restore it in case of failure**.  
- Deliverables include:  
  - **Backup and recovery scripts**  
  - **Documentation of the process**  

### 📜 Why Database Backup and Recovery?  
- Protects against **data loss** in case of system crashes, accidental deletions, or corruption.  
- Ensures **business continuity** by restoring databases quickly.  
- Acts as a safeguard during **migrations, upgrades, or testing**.  

---

## 🛠️ Tools and Technologies  

- **DBMS Used**: MySQL (you can adapt for PostgreSQL, MongoDB, or SQL Server)  
- **Backup Tool**: `mysqldump`  
- **Restore Tool**: `mysql` client  
- **Environment**: Linux/MacOS terminal (works similarly on Windows with Git Bash or WSL)  

---

## ⚙️ Setup Instructions  

### 1️⃣ Install MySQL  
Make sure MySQL server and client are installed on your system.  

Check installation:  
```bash
mysql --version
````

### 2️⃣ Create a Sample Database

```sql
CREATE DATABASE library_db;

USE library_db;

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    year_published INT,
    genre VARCHAR(50)
);

INSERT INTO books (title, author, year_published, genre) VALUES
('1984', 'George Orwell', 1949, 'Dystopian'),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Classic'),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Classic'),
('The Catcher in the Rye', 'J.D. Salinger', 1951, 'Classic'),
('Brave New World', 'Aldous Huxley', 1932, 'Dystopian');
```

### 3️⃣ Verify Data

```sql
SELECT * FROM books;
```

---

## 💾 Backup Process

We use **mysqldump** to create a backup file.

### Command:

```bash
mysqldump -u root -p library_db > library_db_backup.sql
```

* `-u root` → Username (root by default, or use your MySQL user)
* `-p` → Prompts for password
* `library_db` → Database name
* `library_db_backup.sql` → Output SQL file containing schema + data

✅ A file `library_db_backup.sql` will be created in your project folder.

---

## 💥 Simulating Failure

To demonstrate recovery, first drop the database (⚠️ be careful in real-world cases).

```sql
DROP DATABASE library_db;
```

Now the database and its data are gone.

---

## 🔄 Recovery Process

Restore the database using the backup file.

### Command:

```bash
mysql -u root -p < library_db_backup.sql
```

This recreates the database and restores all tables + data.

---


---

## 📜 Scripts

### 🔹 backup.sh

```bash
#!/bin/bash
# Backup script for library_db
mysqldump -u root -p library_db > library_db_backup.sql
echo "✅ Backup completed: library_db_backup.sql created."
```

### 🔹 restore.sh

```bash
#!/bin/bash
# Restore script for library_db
mysql -u root -p < library_db_backup.sql
echo "✅ Database restored from library_db_backup.sql."
```

Make scripts executable:

```bash
chmod +x backup.sh restore.sh
```

---

## 🧪 Testing the Process

1. Run `./backup.sh` → Creates a backup file.
2. Drop the database using MySQL.
3. Run `./restore.sh` → Restores the database.
4. Verify restored data using:

   ```sql
   SELECT * FROM books;
   ```

---

## 📊 Documentation

A detailed explanation with **step-by-step screenshots** is included in:

This covers:

* Database creation
* Backup
* Failure simulation
* Recovery

---

## ✅ Outcome

* Backup and recovery successfully demonstrated.
* Scripts and documentation are provided.
* This process ensures data safety and recovery in case of failures.

---
