import os
from app.config.mysqlconnection import connectToMySQL
from app.models.usuarios import Usuario
from flask import flash

NOMBRE_MINIMO = 2

class Viaje:   

    def __init__(self, data):
        self.id = data.get('id', 0)
        self.travel_date_from = data.get('travel_date_from')
        self.travel_date_to = data.get('travel_date_to')
        self.nombre = data.get('nombre')
        self.descripcion = data.get('descripcion')
        self.usuario_id = data.get('usuario_id')
        self.created_at = data.get('created_at', '')
        self.updated_at = data.get('updated_at', '')
        self.usuario = None

    @staticmethod
    def validar(data):

        todo_ok = True

        if len(data['nombre']) < NOMBRE_MINIMO:
            flash("El nombre debe tener al menos 2 caracteres", "danger")
            todo_ok = False

        return todo_ok

    @classmethod
    def get_all(cls):
        todos_los_datos = []

        sql = """
            SELECT * FROM viajes JOIN usuarios ON viajes.usuario_id = usuarios.id;
        """
        result = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql);
        for fila in result:
            print("FILA::::", fila)
            print("FILA::::", type(fila))
            instancia = cls(fila)
            data = {
                'id': fila['usuarios.id'],
                'nombre': fila['usuarios.nombre'],
                'apellido': fila['apellido'],
                'email': fila['email'],
                'password': fila['password'],
                'created_at': fila['usuarios.created_at'],
                'updated_at': fila['usuarios.updated_at'],
            }
            instancia.usuario = Usuario(data)
            todos_los_datos.append(instancia)
        return todos_los_datos

    @classmethod
    def save(cls, data):
        sql = """
        INSERT INTO viajes (nombre, travel_date_from, travel_date_to, descripcion, usuario_id, created_at, updated_at)
        VALUES (%(nombre)s, %(travel_date_from)s, %(travel_date_to)s, %(descripcion)s, %(usuario_id)s, NOW(), NOW());
        """
        id = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data)
        resultado = None
        if id:
            resultado = cls.get(id)
        return resultado

    @classmethod
    def get(cls, id):
        sql = """
        SELECT id, nombre, travel_date_from, travel_date_to, descripcion, usuario_id, created_at, updated_at FROM viajes WHERE id = %(id)s;
        """
        data = {
            'id': id
        }
        result = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data);
        
        viaje = cls(result[0])

        usuario = Usuario.get(viaje.usuario_id)
        viaje.usuario = usuario

        return viaje

    @classmethod
    def delete(cls, id):
        sql = """
        DELETE FROM viajes WHERE id = %(id)s;
        """
        data = {
            'id': id
        }
        result = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data);

        return result

    def actualizar(self):

        sql = """
            UPDATE viajes
                SET
                nombre = %(nombre)s,
                travel_date_from = %(travel_date_from)s,
                travel_date_to = %(travel_date_to)s,
                descripcion = %(descripcion)s,
                usuario_id = %(usuario_id)s,
                updated_at = NOW()
                WHERE id = %(id)s;
            """

        data = {
            'nombre': self.nombre,
            'travel_date_from': self.travel_date_from,
            'travel_date_to': self.travel_date_to,
            'descripcion': self.descripcion,
            'usuario_id': self.usuario_id,
            'id': self.id
        }
        self.id = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data)
        return self