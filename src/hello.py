import os
from flask import Flask
import mysql.connector


class DBManager:
    def __init__(self, database='example', host='db', user='root', password_file=None):
        pf = open(password_file, 'r')
        password = str(pf.read())[:-1]
        self.database='example'
        self.host='db'
        self.user='alex'
        self.password='HOOSojdZVupS'
        print(f'password: {password}, user: {user}, host: {host}, db: {database}')
        self.connection = mysql.connector.connect(
            user=user, 
            password=self.password,
            host=host, # name of the mysql service as set in the docker compose file
            database=database,
            auth_plugin='mysql_native_password'
        )
        pf.close()
        self.cursor = self.connection.cursor()
    
    def populate_db(self):
        self.cursor.execute('DROP TABLE IF EXISTS blog')
        self.cursor.execute('CREATE TABLE blog (id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(255))')
        self.cursor.executemany('INSERT INTO blog (id, title) VALUES (%s, %s);', [(i, 'Blog post #%d'% i) for i in range (1,5)])
        self.connection.commit()
    
    def query_titles(self):
        self.cursor.execute('SELECT title FROM blog')
        rec = []
        for c in self.cursor:
            rec.append(c[0])
        return rec


server = Flask(__name__)
conn = None

@server.route('/')
def listBlog():
    global conn
    if not conn:
        database = os.getenv('DB_NAME')
        user = os.getenv('DB_USERNAME')
        host = 'db'
        conn = DBManager(database=database, host=host, user=user, password_file='/run/secrets/db_password')
        conn.populate_db()
    rec = conn.query_titles()

    response = ''
    for c in rec:
        response = response  + '<div>   Hello  ' + c + '</div>'
    return response


if __name__ == '__main__':
    server.run(debug=True, host='0.0.0.0')
