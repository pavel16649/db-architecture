import os
import time
import subprocess
import datetime

BACKUP_DIR = os.getenv("BACKUP_DIR")
BACKUP_PREFIX = "backup"
BACKUP_INTERVAL_HOURS = int(os.getenv("BACKUP_INTERVAL_HOURS"))
BACKUP_KEEP_COUNT = int(os.getenv("BACKUP_KEEP_COUNT"))


def backup_db():
    backup_file = f"{os.getenv('BACKUP_DIR')}/backup-{int(time.time())}.sql.gz"
    cmd = [
        "pg_dump",
        "-h", os.getenv("DB_HOST"),
        "-p", str(os.getenv("DB_PORT")),
        "-U", os.getenv("DB_USER"),
        "-F", "c",
        "-Z", "9",
        "-f", backup_file,
        os.getenv("DB_NAME")
    ]
    subprocess.run(cmd, env={"PGPASSWORD": os.getenv("DB_PASSWORD")}, check=True)
    print(f"Backup created: {backup_file}")


# Функция для удаления старых бэкапов
def delete_old_backups():
    backup_files = os.listdir(BACKUP_DIR)
    backup_files = [f for f in backup_files if f.startswith(BACKUP_PREFIX)]
    backup_files = sorted(backup_files, key=lambda x: int(x.split("-")[1].split(".")[0]))
    if len(backup_files) > BACKUP_KEEP_COUNT:
        for i in range(len(backup_files) - BACKUP_KEEP_COUNT):
            os.remove(f"{BACKUP_DIR}/{backup_files[i]}")
            print(f"Deleted old backup: {backup_files[i]}")


# Главный цикл
while True:
    backup_db()
    delete_old_backups()
    time.sleep(datetime.timedelta(hours=BACKUP_INTERVAL_HOURS).total_seconds())
