import mysql.connector

database='example'
host='db'
user='alex'
password='HOOSojdZVupS'
connection = mysql.connector.connect(
            user=user,
            password=password,
            host='db', # name of the mysql service as set in the docker compose file
            database=database,
            auth_plugin='mysql_native_password'
        )
cursor = connection.cursor()
cursor.execute('DROP TABLE IF EXISTS blog')
cursor.execute('CREATE TABLE blog (id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(255))')
cursor.executemany('INSERT INTO blog (id, title) VALUES (%s, %s);', [(i, 'Blog post #%d'% i) for i in range (1,5)])
connection.commit()

cursor.execute('SELECT title FROM blog')

rec = []

for c in cursor:
    rec.append(c[0])

print(rec)
