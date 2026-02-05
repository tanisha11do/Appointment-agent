import os
import mysql.connector
from dotenv import load_dotenv

load_dotenv()

def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="Bro2zxcf@ur",
        database="doctor_booking",
        auth_plugin="mysql_native_password"
    )